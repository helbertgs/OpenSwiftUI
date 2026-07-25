//
// _GraphValue.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 11, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// An opaque handle to an `Attribute` in the graph.
///
/// Views and modifiers receive a `_GraphValue` instead of a raw `Attribute`,
/// preserving the contract that nobody outside the graph manipulates storage
/// directly. Reading `.value` inside a `rule {}` automatically registers a
/// dependency.
@MainActor
public struct _GraphValue<Value> {

    let storage: _GraphValueStorage<Value>

    /// The current value of the wrapped attribute.
    ///
    /// Reading this inside a rule registers a dependency on the underlying attribute.
    var wrappedValue: Value {
        switch storage {
            case .attribute(let attribute): attribute.wrappedValue
            case .value(let v): v
        }
    }

    var projectedValue: Attribute<Value> {
        switch storage {
            case .attribute(let attribute): attribute
            default: fatalError()
        }
    }

    /// Creates a graph value that wraps the given attribute.
    ///
    /// - Parameter attribute: The attribute to wrap.
    init(attribute value: Attribute<Value>) {
        storage = .attribute(value)
    }

    init(value: Value) {
        storage = .value(value)
    }
}

extension _GraphValue {

    enum _GraphValueStorage<V> {
        case attribute(Attribute<V>)
        case value(V)
    }
}
