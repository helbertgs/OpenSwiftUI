//
// AnyView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A type-erased view.
///
/// An `AnyView` allows changing the type of view used in a given view
/// hierarchy. Whenever the type of view used with an `AnyView` changes, the old
/// hierarchy is destroyed and a new hierarchy is created for the new type.
@frozen
public struct AnyView: View {

    // MARK: - Type Alias.

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    // MARK: - Internal Property(ies).

    let storage: AnyViewStorageBase

    // MARK: - Creating a view.

    /// Create an instance that type-erases `view`.
    public init<V>(_ view: V) where V: View {
        storage = AnyViewStorage(view)
    }

    public init?(_fromValue value: Any) {
        storage = AnyViewStorage(value)
    }

    public init<T: View>(erasing: T) {
        storage = AnyViewStorage(erasing)
    }

    // MARK: - Static Function(s).

    /// Builds the view outputs for this view within the attribute graph.
    ///
    /// - Parameters:
    ///   - view: The graph value wrapping this view instance.
    ///   - inputs: The view inputs propagated from the parent context.
    /// - Returns: The `_ViewOutputs` produced for this view.
    public static func _makeView(view: _GraphValue<AnyView>, inputs: _ViewInputs) -> _ViewOutputs {
        .init()
    }

    // MARK: - Internal Structure(s).

    @usableFromInline
    class AnyViewStorageBase { }

    @usableFromInline
    class AnyViewStorage<V>: AnyViewStorageBase {

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
