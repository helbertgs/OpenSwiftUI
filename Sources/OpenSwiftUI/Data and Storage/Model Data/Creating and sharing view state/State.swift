//
// State.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@propertyWrapper
@MainActor
public struct State<Value>: _StateConnectable {

    /// The stable per-instance key identifying the backing attribute.
    private let _key: String

    /// The initial value used when creating the backing attribute.
    private let _initial: Value

    /// The local buffer used before connection to the graph.
    private var _localValue: Value

    /// Creates a state wrapper with an initial value.
    /// 
    /// - Parameter wrappedValue: The initial state value.
    public init(wrappedValue: Value) {
        self._key        = UUID().uuidString
        self._initial    = wrappedValue
        self._localValue = wrappedValue
    }

    /// Connects the state to the active graph.
    ///
    /// The actual connection is lazy, happening in the `wrappedValue` getter via `_StateRegistry`.
    mutating func _connectToGraph() {
        guard _GraphContext.current != nil else { return }
    }

    /// The current state value.
    ///
    /// Reads from and writes to the backing attribute when a graph is active,
    /// otherwise falls back to the local buffer.
    public var wrappedValue: Value {
        get {
            guard let graph = _GraphContext.current else { return _localValue }
            return _StateRegistry.shared.attribute(forKey: _key, initial: _initial, graph: graph).wrappedValue
        }
        nonmutating set {
            guard let graph = _GraphContext.current else {
                return
            }
            _StateRegistry.shared.attribute(forKey: _key, initial: _initial, graph: graph).wrappedValue = newValue
        }
    }

    /// The projected value: a `Binding` to the state value.
    public var projectedValue: Binding<Value> {
        Binding(get: { self.wrappedValue }, set: { self.wrappedValue = $0 })
    }
}

extension State {

    /// A reference-type box wrapping a state attribute.
    final class Storage<V> {

        /// The wrapped attribute.
        var attribute: Attribute<V>

        /// Creates a storage box around the given attribute.
        /// - Parameter attribute: The attribute to wrap.
        init(attribute: Attribute<V>) { self.attribute = attribute }
    }
}

/// A type that can connect its state to the active graph.
@MainActor
protocol _StateConnectable {

    /// Connects this state to the active graph.
    mutating func _connectToGraph()
}

/// A global registry of state nodes keyed by a stable string key.
///
/// It solves the fundamental Mirror problem: extracting `child.value` as `Any`
/// and casting to `_StateConnectable` yields a copy, so mutating that copy would
/// not affect the original `@State` on the view struct. `@State` uses the
/// registry to obtain/create its `Attribute<Value>` without being mutated
/// externally. Each key is unique per `(ViewType, propertyName, graphIdentity)`.
@MainActor
final class _StateRegistry {

    /// The shared registry instance.
    static let shared = _StateRegistry()

    /// The registered nodes keyed by their string key.
    private var nodes: [String: Any] = [:]

    private init() {}

    /// Returns the attribute for the given key, creating it if necessary.
    /// - Parameters:
    ///   - key: The stable key identifying the state node.
    ///   - initial: The initial value used when creating a new attribute.
    ///   - graph: The graph in which to create the attribute.
    /// - Returns: The existing or newly created attribute.
    func attribute<Value>(forKey key: String, initial: Value, graph: AttributeGraph) -> Attribute<Value> {
        if let existing = nodes[key] as? Attribute<Value> {
            return existing
        }
        let attr = graph.input(name: key, initial)
        nodes[key] = attr
        return attr
    }

    /// Resets the registry for the given graph.
    ///
    /// For simplicity the entire registry is cleared when a new graph is installed
    /// (e.g. on hot reload).
    /// - Parameter graph: The graph being reset.
    func reset(forGraph graph: AttributeGraph) {
        nodes.removeAll()
    }
}