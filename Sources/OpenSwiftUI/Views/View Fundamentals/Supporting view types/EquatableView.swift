//
// EquatableView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 22, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A view type that compares itself against its previous value and prevents its
/// child updating if its new value is the same as its old value.
@frozen 
public struct EquatableView<Content>: View where Content: Equatable, Content: View {

    // MARK: - Type Alias.

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never { fatalError() }

    public var content: Content

    // MARK: - Constructor(s).

    @inlinable public init(content: Content) {
        self.content = content
    }

    // MARK: - View Protocol

    public static func _makeView(view: _GraphValue<EquatableView<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        Content._makeView(view: .init(view.value.content), inputs: inputs)
    }
}
