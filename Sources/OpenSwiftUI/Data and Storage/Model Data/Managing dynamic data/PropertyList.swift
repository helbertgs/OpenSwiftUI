//
// PropertyList.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

/// A singly-linked list of typed key-value pairs, identical in spirit to SwiftUI's
/// internal `PropertyList`.
///
/// Both `Transaction` and `EnvironmentValues` use this as their backing store.
/// Each distinct key type produces its own `TypedElement<K>` subclass, so the
/// list is heterogeneous but fully type-safe through the key subscript.
struct PropertyList: CustomStringConvertible, Sendable {

    // MARK: - Storage

    var elements: Element?

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