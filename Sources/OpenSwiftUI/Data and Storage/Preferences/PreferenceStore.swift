//
// PreferenceStore.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 16, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//


/// A store of preference values keyed by preference key type.
@MainActor
public struct PreferenceStore {
    
    /// The backing entries keyed by preference key type identity.
    private var entries: [ObjectIdentifier: any _AnyPreferenceEntry] = [:]

    /// Sets or reduces a value for the given preference key.
    /// - Parameters:
    ///   - key: The preference key type.
    ///   - value: The value to set or reduce into the existing value.
    mutating func set<K: PreferenceKey>(_ key: K.Type, value: K.Value) {
        let id = ObjectIdentifier(key)
        if entries[id] == nil {
            entries[id] = _PreferenceEntry<K>(value)
        } else {
            var existing = entries[id]!
            _PreferenceEntry<K>(value).reduce(into: &existing)
            entries[id] = existing
        }
    }

    /// Retrieves the value for the given preference key.
    /// - Parameter key: The preference key type.
    /// - Returns: The stored value, or the key's default value if none is set.
    func get<K: PreferenceKey>(_ key: K.Type) -> K.Value {
        guard let entry = entries[ObjectIdentifier(key)] as? _PreferenceEntry<K> else {
            return K.defaultValue
        }
        return entry.value
    }

    /// Merges another store into this one, reducing values with matching keys.
    /// - Parameter other: The store to merge in.
    mutating func merge(_ other: PreferenceStore) {
        for (id, entry) in other.entries {
            if entries[id] == nil {
                entries[id] = entry
            } else {
                var existing = entries[id]!
                entry.reduce(into: &existing)
                entries[id] = existing
            }
        }
    }
}