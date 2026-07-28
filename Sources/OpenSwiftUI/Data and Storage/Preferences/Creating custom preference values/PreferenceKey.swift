//
// PreferenceKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// A named value produced by a view.
///
/// A view with multiple children automatically combines its values for a given
/// preference into a single value visible to its ancestors.
public protocol PreferenceKey {

    /// The type of value produced by this preference.
    associatedtype Value

    /// The default value of the preference.
    ///
    /// Views that have no explicit value for the key produce this default
    /// value. Combining child views may remove an implicit value produced by
    /// using the default. This means that `reduce(value: &x, nextValue:
    /// {defaultValue})` shouldn't change the meaning of `x`.
    static var defaultValue: Self.Value { get }

    /// Combines a sequence of values by modifying the previously-accumulated
    /// value with the result of a closure that provides the next value.
    ///
    /// This method receives its values in view-tree order. Conceptually, this
    /// combines the preference value from one tree with that of its next
    /// sibling.
    ///
    /// - Parameters:
    ///   - value: The value accumulated through previous calls to this method.
    ///     The implementation should modify this value.
    ///   - nextValue: A closure that returns the next value in the sequence.
    static func reduce(value: inout Self.Value, nextValue: () -> Self.Value)
}

extension PreferenceKey where Self.Value : ExpressibleByNilLiteral {

    /// Let nil-expressible values default-initialize to nil.
    public static var defaultValue: Self.Value { nil }
}

/// A type-erased preference entry stored in a `PreferenceStore`.
@MainActor
protocol _AnyPreferenceEntry {

    /// The object-identity key of the underlying preference key type.
    var key: ObjectIdentifier { get }

    /// Reduces this entry into another entry of the same key type.
    /// - Parameter other: The entry to reduce into, modified in place.
    func reduce(into other: inout _AnyPreferenceEntry)

    /// Returns the stored value as `Any`.
    /// - Returns: The type-erased stored value.
    func asAny() -> Any
}

/// A concrete, type-safe preference entry for a specific `PreferenceKey`.
@MainActor
final class _PreferenceEntry<K: PreferenceKey>: _AnyPreferenceEntry {

    /// The stored preference value.
    var value: K.Value

    /// Creates an entry wrapping the given value.
    /// - Parameter value: The preference value to store.
    init(_ value: K.Value) { self.value = value }

    /// The object-identity key of the preference key type.
    var key: ObjectIdentifier { ObjectIdentifier(K.self) }

    /// Reduces this entry's value into another entry of the same key type.
    /// 
    /// - Parameter other: The entry to reduce into, modified in place.
    func reduce(into other: inout _AnyPreferenceEntry) {
        guard let typed = other as? _PreferenceEntry<K> else { return }
        let captured = value
        K.reduce(value: &typed.value) { captured }
    }

    /// Returns the stored value as `Any`.
    /// 
    /// - Returns: The type-erased stored value.
    func asAny() -> Any { value }
}