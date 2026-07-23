//
// AttributeGraph+Storage.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 16, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

extension AttributeGraph {

/// A single slot in the graph.
///
/// The graph owns every node; an `Attribute<V>` is merely a handle (a
/// `UInt32` index) that refers back to this slot.
final class Storage {

    /// The index of this storage slot within the graph arena.
    let index: UInt32

    /// A human-readable name used for debugging and identification.
    var name: String

    /// The edges pointing into this node, representing the attributes this node depends on.
    var incoming: [Edge] = []

    /// The edges leaving this node, representing the attributes that depend on this node.
    var outgoing: [Edge] = []

    /// Whether the cached value is stale and must be recomputed.
    ///
    /// Marking a node dirty cascades the dirty flag to all downstream nodes so
    /// invalidation propagates through the graph.
    var isDirty: Bool = false {
        didSet {
            guard isDirty, isDirty != oldValue else { return }
            for edge in outgoing { edge.to.isDirty = true }
        }
    }

    /// The closure that recomputes this node's value, or `nil` for input nodes.
    var recompute: (() -> Void)?

    /// The most recently computed value, type-erased as `Any?`.
    var _cachedValue: Any?

    /// The set of `PropertyListKey` identities read during the last evaluation of
    /// this node. Non-nil only for rule nodes that actually read a `PropertyList`
    /// (i.e. `EnvironmentValues` or `Transaction`). Used by `flushPendingChanges`
    /// to skip dirty propagation when the changed key wasn't read by this node.
    var trackedKeys: Set<ObjectIdentifier>?

    /// A textual description of the cached value for debugging.
    var debugDescription: String { _cachedValue.map { "\($0)" } ?? "<nil>" }

    /// Creates a storage slot with the given index and name.
    ///
    /// - Parameters:
    ///   - index: The arena index of this slot.
    ///   - name: A human-readable name for debugging.
    init(index: UInt32, name: String) {
        self.index = index
        self.name = name
    }

    /// Removes all incoming dependency edges from this node.
    ///
    /// Each incoming edge is also detached from its source node's outgoing list,
    /// keeping both ends of the graph consistent.
    func removeIncomingEdges() {
        for edge in incoming {
            edge.from.outgoing.removeAll { $0 === edge }
        }
        incoming = []
    }
}

}