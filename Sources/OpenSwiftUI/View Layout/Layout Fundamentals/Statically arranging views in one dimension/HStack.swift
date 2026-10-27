//
// HStack.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A view that arranges its subviews in a horizontal line.
///
/// Unlike ``LazyHStack``, which only renders the views when your app needs to
/// display them onscreen, an `HStack` renders the views all at once, regardless
/// of whether they are on- or offscreen. Use the regular `HStack` when you have
/// a small number of subviews or don't want the delayed rendering behavior
/// of the "lazy" version.
///
/// The following example shows a simple horizontal stack of five text views:
///
///     var body: some View {
///         HStack(
///             alignment: .top,
///             spacing: 10
///         ) {
///             ForEach(
///                 1...5,
///                 id: \.self
///             ) {
///                 Text("Item \($0)")
///             }
///         }
///     }
///
/// ![Five text views, named Item 1 through Item 5, arranged in a
/// horizontal row.](OpenSwiftUI-HStack-simple.png)
///
/// > Note: If you need a horizontal stack that conforms to the ``Layout``
/// protocol, like when you want to create a conditional layout using
/// ``AnyLayout``, use ``HStackLayout`` instead.
public struct HStack<Content> where Content : View {

    let _tree: _VariadicView.Tree<HStackLayout, Content>

    /// Creates a horizontal stack with the given spacing and vertical alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This
    ///     guide has the same vertical screen coordinate for every subview.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - content: A view builder that creates the content of this stack.
    public init(alignment: VerticalAlignment = .center, spacing: Double? = nil, @ViewBuilder content: () -> Content) {
        _tree = .init(HStackLayout(alignment: alignment, spacing: spacing)) {
            content()
        }
    }
}

extension HStack : View {

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
    public static func _makeView(view: _GraphValue<HStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        .init()
    }
}
