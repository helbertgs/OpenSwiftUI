//
// PreferenceValues.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A type-erased storage for accumulated preference values.
public struct PreferenceValues {
    private var storage: [ObjectIdentifier: Any] = [:]

    public init() {}

    public subscript<Key: PreferenceKey>(_ key: Key.Type) -> Key.Value {
        get {
            storage[ObjectIdentifier(key)] as? Key.Value ?? key.defaultValue
        }
        set {
            storage[ObjectIdentifier(key)] = newValue
        }
    }
}
