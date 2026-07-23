//
// AttributeGraph.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 16, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

/// A dependency graph implemented as an arena of `AttributeStorage`.
///
/// `Attribute<Value>` is a struct holding a `UInt32` index, matching SwiftUI's
/// internal design. The `@MainActor` isolation reflects SwiftUI's reality: the
/// view graph is always manipulated on the main thread.
@MainActor
public final class AttributeGraph {

    /// The contiguous arena holding every node in the graph.
    private(set) var arena: [Storage] = []

    /// The stack of attribute indices currently being evaluated.
    ///
    /// `@MainActor` guarantees single-threaded access, so no lock is required.
    private var _evaluationStack: [UInt32] = []

    /// The index of the attribute at the top of the evaluation stack, if any.
    var currentStorageIndex: UInt32? { _evaluationStack.last }

    /// Pushes an attribute index onto the evaluation stack.
    ///
    /// - Parameter index: The index of the attribute beginning evaluation.
    func pushEvaluation(_ index: UInt32) {
        _evaluationStack.append(index)
    }

    /// Pops the most recently pushed attribute index from the evaluation stack.
    func popEvaluation() {
        _evaluationStack.removeLast()
    }

    /// Attributes modified since the last flush, paired with the set of
    /// `PropertyListKey` identities that changed (non-nil only when the modified
    /// attribute holds a `PropertyList`-backed value such as `EnvironmentValues`).
    private var _dirtyAttributes: [(index: UInt32, changedKeys: Set<ObjectIdentifier>?)] = []

    /// Whether a flush has already been scheduled on the next actor cycle.
    private var _scheduledFlush = false

    /// Records that `storage` was modified.
    ///
    /// - Parameters:
    ///   - storage: The attribute storage that changed.
    ///   - changedKeys: When the storage holds a `PropertyList`-backed value,
    ///     the set of key identities that actually changed. `nil` for plain values.
    func recordChange(on storage: Storage, changedKeys: Set<ObjectIdentifier>? = nil) {
        _dirtyAttributes.append((index: storage.index, changedKeys: changedKeys))

        if !_scheduledFlush {
            _scheduledFlush = true
            Task { @MainActor [weak self] in self?.flushPendingChanges() }
        }
    }

    /// Propagates invalidations for all dirty attributes, using `trackedKeys` on
    /// downstream nodes to skip unnecessary dirty marks.
    ///
    /// When a downstream node has recorded the keys it read (via `Tracker`) and
    /// the upstream change carries key information, dirty propagation is skipped
    /// unless the sets intersect.
    func flushPendingChanges() {
        guard !_dirtyAttributes.isEmpty else { return }
        let dirty = _dirtyAttributes
        _dirtyAttributes = []
        _scheduledFlush = false

        for entry in dirty {
            let storage = arena[Int(entry.index)]
            for edge in storage.outgoing {
                // Fine-grained check: skip if the downstream node only reads
                // keys that didn't change.
                if let changedKeys = entry.changedKeys,
                   let tracked = edge.to.trackedKeys,
                   tracked.isDisjoint(with: changedKeys) {
                    continue
                }
                edge.isPending = true
                edge.to.isDirty = true
            }
        }
    }

    /// Creates an input attribute holding an explicit initial value.
    ///
    /// The returned `Attribute<Value>` is a pure handle (only a `UInt32` index);
    /// the graph is not carried inside it and is instead reached via
    /// `_GraphContext`.
    ///
    /// - Parameters:
    ///   - name: An optional debug name; defaults to the lowercased type name.
    ///   - value: The initial value stored in the attribute.
    /// - Returns: A handle to the newly created input attribute.
    /// - Example:
    /// ```swift
    /// let count = graph.input(name: "count", 0)
    /// ```
    @discardableResult
    func input<Value>(name: String? = nil, _ value: Value) -> Attribute<Value> {
        let idx = UInt32(arena.count)
        let storage = Storage(index: idx, name: name ?? "\(Value.self)".lowercased())
        storage._cachedValue = value
        arena.append(storage)
        return Attribute(index: idx)
    }

    /// Creates a derived attribute whose value is produced by a rule closure.
    ///
    /// The rule is evaluated lazily and re-evaluated when its dependencies
    /// change. The returned handle is a pure index; the graph is accessed
    /// implicitly during evaluation.
    ///
    /// - Parameters:
    ///   - name: An optional debug name; defaults to the lowercased type name.
    ///   - rule: A closure that computes the derived value.
    /// - Returns: A handle to the newly created derived attribute.
    /// - Example:
    /// ```swift
    /// let a = graph.input(2)
    /// let doubled = graph.rule { a.wrappedValue * 2 }
    /// ```
    @discardableResult
    func rule<Value>(name: String? = nil, _ rule: @escaping () -> Value) -> Attribute<Value> {
        let idx = UInt32(arena.count)
        let storage = Storage(index: idx, name: name ?? "\(Value.self)".lowercased())
        arena.append(storage)
        let attr = Attribute<Value>(index: idx)
        storage.recompute = { [weak self] in
            guard let self else { return }
            let newValue = rule()
            self.arena[Int(idx)]._cachedValue = newValue
        }
        return attr
    }

    /// Creates an empty attribute graph.
    init() {}
}
/// Module-level `TaskLocal` for the active `PropertyList.Tracker`.
///
/// Declared at module scope (not inside a `@MainActor` type) so that
/// `PropertyList.subscript` — which is `nonisolated` because `PropertyList`
/// is `Sendable` — can read it without an actor hop.
@TaskLocal var _currentTrackerStorage: PropertyList.Tracker? = nil
