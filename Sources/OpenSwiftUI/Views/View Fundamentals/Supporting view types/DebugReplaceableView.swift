//
// DebugReplaceableView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct DebugReplaceableView: View {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Public Property(ies).

    public var body: Never { fatalError() }

    // MARK: - Internal Property(ies).

    var storage: DebugReplaceableViewStorageBase

    // MARK: - Constructor(s).

    public init<V>(_ view: V) where V: View {
        storage = DebugReplaceableViewStorage(view)
    }

    public init?(_fromValue value: Any) {
        storage = DebugReplaceableViewStorage(value)
    }

    public init<T: View>(erasing: T) {
        storage = DebugReplaceableViewStorage(erasing)
    }

    // MARK: - Static Function(s).

    public static func _makeView(view: _GraphValue<DebugReplaceableView>, inputs: _ViewInputs) -> _ViewOutputs {
        if let storage = view.value.storage as? DebugReplaceableViewStorage<Any>, let view = storage._view as? any View {
            func build<V>(_ v: V, inputs: _ViewInputs) -> _ViewOutputs where V: View {
                V._makeView(view: .init(v), inputs: inputs)
            }

            return build(view, inputs: inputs)
        }

        return .init()
    }

    // MARK: - Internal Structure(s).

    @usableFromInline
    class DebugReplaceableViewStorageBase { }

    @usableFromInline
    class DebugReplaceableViewStorage<V>: DebugReplaceableViewStorageBase {

        // MARK: - Property(ies).
        @usableFromInline
        var _view: V

        // MARK: - Constructor(s).
        @usableFromInline
        init(_ view: V) {
            self._view = view
        }
    }
}
