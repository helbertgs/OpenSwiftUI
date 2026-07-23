//
// Attribute.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 16, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

/// A lightweight handle to a node in the attribute graph.
///
/// An `Attribute` is a pure handle backed by a single `UInt32` index, making a
/// copy only four bytes wide. The graph itself is never carried inside the
/// handle; it is accessed implicitly through `_GraphContext.current`.
///
/// This design mirrors Apple's internal AttributeGraph, where `Attribute<V>` is
/// a `UInt32` and the graph is an implicit context of the evaluating thread.
@MainActor
struct Attribute<V> {

    /// The index identifying this attribute's storage slot inside the graph arena.
    let index: UInt32

    /// The graph that is active in the current execution context.
    ///
    /// Accessing this property outside of `_GraphContext.withGraph` triggers an
    /// immediate crash by design, because no `Attribute` should ever exist
    /// without an active graph.
    private var graph: AttributeGraph {
        guard let g = _GraphContext.current else {
            fatalError("Attribute<\(V.self)> accessed outside of _GraphContext.withGraph")
        }
        return g
    }

    /// The backing storage slot for this attribute within the active graph's arena.
    var storage: AttributeGraph.Storage { graph.arena[Int(index)] }

    /// The current value of the attribute.
    ///
    /// Reading registers a dependency when evaluated inside a rule and lazily
    /// recomputes the value if it is stale. Writing is only valid for input
    /// attributes; assigning to a derived (rule) attribute traps in debug builds.
    ///
    /// - Example:
    /// ```swift
    /// let count = graph.input(0)
    /// count.wrappedValue = 5
    /// print(count.wrappedValue) // 5
    /// ```
    var wrappedValue: V {
        get {
            registerDependencyIfNeeded()
            recomputeIfNeeded()
            return storage._cachedValue as! V
        }
        nonmutating set {
            assert(storage.recompute == nil, "Não é possível setar um atributo derivado (rule)")
            storage._cachedValue = newValue
            graph.recordChange(on: storage)
        }
    }

    /// Sets a new `PropertyList`-backed value and records which keys changed,
    /// enabling fine-grained dirty propagation to downstream rules.
    ///
    /// Called by the `EnvironmentValues` and `Transaction` input-attribute setters
    /// when only specific keys were modified.
    func setValue(_ newValue: V, changedKeys: Set<ObjectIdentifier>) {
        assert(storage.recompute == nil, "Não é possível setar um atributo derivado (rule)")
        storage._cachedValue = newValue
        graph.recordChange(on: storage, changedKeys: changedKeys)
    }

    /// Records a dependency edge from this attribute to the attribute currently
    /// being evaluated, when appropriate.
    ///
    /// A dependency is registered only if there is an active evaluation, the
    /// current attribute differs from this one, and no equivalent edge already
    /// exists.
    private func registerDependencyIfNeeded() {
        guard let currentIdx = graph.currentStorageIndex,
              currentIdx != index else { return }

        let currentStorage = graph.arena[Int(currentIdx)]
        guard !storage.outgoing.contains(where: { $0.to === currentStorage }) else { return }

        let edge = AttributeGraph.Edge(from: storage, to: currentStorage)
        storage.outgoing.append(edge)
        currentStorage.incoming.append(edge)
    }

    /// Recomputes the attribute's value when it is dirty or has never been computed.
    ///
    /// Incoming dependency edges are cleared before recomputation so the fresh
    /// set of dependencies is captured during evaluation. After the initial
    /// computation, downstream edges are marked pending to signal that consumers
    /// must re-read the new value.
    ///
    /// A fresh `PropertyList.Tracker` is activated around the `recompute()` call
    /// so that any `PropertyList` reads (via `EnvironmentValues` or `Transaction`)
    /// record which keys were accessed. The recorded keys are stored on the
    /// storage for use by `flushPendingChanges`.
    private func recomputeIfNeeded() {
        guard let recompute = storage.recompute else { return }
        guard storage.isDirty || storage._cachedValue == nil else { return }

        storage.removeIncomingEdges()

        graph.pushEvaluation(index)
        defer { graph.popEvaluation() }

        let tracker = PropertyList.Tracker()
        let wasInitial = storage._cachedValue == nil

        _GraphContext.withTracker(tracker) {
            recompute()
        }

        storage.trackedKeys = tracker.recordedKeys.isEmpty ? nil : tracker.recordedKeys

        if !wasInitial {
            for edge in storage.outgoing { edge.isPending = true }
        }
        storage.isDirty = false
    }

    /// Creates an attribute handle for the given arena index.
    ///
    /// This initializer is internal because only `AttributeGraph` is allowed to
    /// create attributes.
    ///
    /// - Parameter index: The arena index of the backing storage slot.
    init(index: UInt32) {
        self.index = index
    }
}

// MARK: - Fine-grained EnvironmentValues mutation

extension Attribute where V == EnvironmentValues {

    /// Sets a single environment key on this attribute, recording the changed
    /// key identity so `flushPendingChanges` can skip downstream rules that
    /// never read that key.
    func set<K: EnvironmentKey>(_ key: K.Type, to value: K.Value) {
        var env = storage._cachedValue as! EnvironmentValues
        env[key] = value
        setValue(env, changedKeys: [ObjectIdentifier(K.self)])
    }
}