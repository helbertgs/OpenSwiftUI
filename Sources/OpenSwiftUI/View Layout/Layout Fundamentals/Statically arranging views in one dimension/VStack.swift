//
// VStack.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A view that arranges its subviews in a vertical line.
///
/// Unlike ``LazyVStack``, which only renders the views when your app needs to
/// display them, a `VStack` renders the views all at once, regardless
/// of whether they are on- or offscreen. Use the regular `VStack` when you have
/// a small number of subviews or don't want the delayed rendering behavior
/// of the "lazy" version.
///
/// The following example shows a simple vertical stack of 10 text views:
///
///     var body: some View {
///         VStack(
///             alignment: .leading,
///             spacing: 10
///         ) {
///             ForEach(
///                 1...10,
///                 id: \.self
///             ) {
///                 Text("Item \($0)")
///             }
///         }
///     }
///
/// ![Ten text views, named Item 1 through Item 10, arranged in a
/// vertical line.](OpenSwiftUI-VStack-simple.png)
///
/// > Note: If you need a vertical stack that conforms to the ``Layout``
/// protocol, like when you want to create a conditional layout using
/// ``AnyLayout``, use ``VStackLayout`` instead.
public struct VStack<Content> where Content : View {

    let _tree: _VariadicView.Tree<VStackLayout, Content>

    /// Creates an instance with the given spacing and horizontal alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This
    ///     guide has the same vertical screen coordinate for every subview.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - content: A view builder that creates the content of this stack.
    public init(alignment: HorizontalAlignment = .center, spacing: Double? = nil, @ViewBuilder content: () -> Content) {
        _tree = .init(VStackLayout(alignment: alignment, spacing: spacing)) {
            content()
        }
    }
}

extension VStack : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    /// Builds the view outputs for this view within the attribute graph.
    ///
    /// - Parameters:
    ///   - view: The graph value wrapping this view instance.
    ///   - inputs: The view inputs propagated from the parent context.
    /// - Returns: The `_ViewOutputs` produced for this view.
    public static func _makeView(view: _GraphValue<VStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("not implemented yet")
    }
}
