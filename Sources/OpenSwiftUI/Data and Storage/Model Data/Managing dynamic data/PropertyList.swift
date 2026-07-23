//
// PropertyList.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

/// A singly-linked list of typed key-value pairs, identical in spirit to SwiftUI's
/// internal `PropertyList`.
///
/// Both `Transaction` and `EnvironmentValues` use this as their backing store.
/// Each distinct key type produces its own `TypedElement<K>` subclass, so the
/// list is heterogeneous but fully type-safe through the key subscript.
struct PropertyList: CustomStringConvertible, Sendable {

    // MARK: - Storage

    var elements: Element?

    init() {
        elements = nil
    }

    // MARK: - Queries

    var isEmpty: Bool { elements == nil }

    func isIdentical(to other: PropertyList) -> Bool {
        elements === other.elements
    }

    // MARK: - CustomStringConvertible

    var description: String {
        var parts: [String] = []
        var current = elements
        while let node = current {
            parts.append(node.description)
            current = node.next
        }
        return parts.isEmpty ? "PropertyList()" : "PropertyList(\(parts.joined(separator: ", ")))"
    }
}

// MARK: - Element

extension PropertyList {

    /// Base class for every node in the linked list.
    ///
    /// Subclasses store a strongly typed value and the key identity needed to
    /// look up and replace nodes.
    class Element: @unchecked Sendable, CustomStringConvertible {
        /// The next node in the list, or `nil` if this is the tail.
        var next: Element?

        public var description: String { "\(Self.self)" }
    }

    /// A concrete node that associates a `PropertyListKey` subtype `K` with its value.
    final class TypedElement<K: PropertyListKey>: Element, @unchecked Sendable {
        var value: K.Value

        init(value: K.Value, next: Element?) {
            self.value = value
            super.init()
            self.next = next
        }

        override var description: String { "\(K.self) = \(value)" }
    }
}

// MARK: - Subscript

extension PropertyList {

    /// Reads or writes the value stored for key `K`.
    ///
    /// On read: walks the list looking for a `TypedElement<K>`. Returns the
    /// key's default value when none is found. If a `Tracker` is active in the
    /// current `_GraphContext`, the key identity is recorded for fine-grained
    /// dependency tracking.
    ///
    /// On write: replaces an existing node in-place when one exists, otherwise
    /// prepends a new node to the front of the list (O(n) search, O(1) prepend).
    subscript<K: PropertyListKey>(_ key: K.Type) -> K.Value {
        get {
            _currentTrackerStorage?.record(key: ObjectIdentifier(K.self))
            var current = elements
            while let node = current {
                if let typed = node as? TypedElement<K> { return typed.value }
                current = node.next
            }
            return K.defaultValue
        }
        set {
            var current = elements
            while let node = current {
                if let typed = node as? TypedElement<K> {
                    typed.value = newValue
                    return
                }
                current = node.next
            }
            elements = TypedElement<K>(value: newValue, next: elements)
        }
    }
}

// MARK: - Tracker

extension PropertyList {

    /// Tracks which `PropertyListKey` types are read during a single rule evaluation.
    ///
    /// The `AttributeGraph` activates a fresh `Tracker` at the start of each
    /// rule's `recompute()` call and reads back the recorded keys afterward.
    /// Those keys are stored on the `AttributeStorage` so that
    /// `flushPendingChanges` can skip dirty propagation to nodes whose tracked
    /// keys don't overlap with the keys that actually changed — fine-grained
    /// invalidation rather than coarse whole-`EnvironmentValues` invalidation.
    final class Tracker: @unchecked Sendable {

        /// The set of key identities read during the tracked evaluation.
        private(set) var recordedKeys: Set<ObjectIdentifier> = []

        init() {}

        /// Called by `PropertyList.subscript` getter to record that key `id` was read.
        func record(key id: ObjectIdentifier) {
            recordedKeys.insert(id)
        }

        /// Returns true if this tracker recorded at least one of the given keys.
        func intersects(_ keys: Set<ObjectIdentifier>) -> Bool {
            !recordedKeys.isDisjoint(with: keys)
        }
    }
}