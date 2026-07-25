//
// ViewModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// A modifier that you apply to a view or another view modifier, producing a
/// different version of the original value.
///
/// Adopt the ``ViewModifier`` protocol when you want to create a reusable
/// modifier that you can apply to any view. The example below combines several
/// modifiers to create a new modifier that you can use to create blue caption
/// text surrounded by a rounded rectangle:
///
///     struct BorderedCaption: ViewModifier {
///         func body(content: Content) -> some View {
///             content
///                 .font(.caption2)
///                 .padding(10)
///                 .overlay(
///                     RoundedRectangle(cornerRadius: 15)
///                         .stroke(lineWidth: 1)
///                 )
///                 .foregroundColor(Color.blue)
///         }
///     }
///
/// You can apply ``modifier(_:)`` directly to a view, but a more common and
/// idiomatic approach uses ``modifier(_:)`` to define an extension to
/// ``View`` itself that incorporates the view modifier:
///
///     extension View {
///         func borderedCaption() -> some View {
///             modifier(BorderedCaption())
///         }
///     }
///
/// You can then apply the bordered caption to any view, similar to this:
///
///     Image(systemName: "bus")
///         .resizable()
///         .frame(width:50, height:50)
///     Text("Downtown Bus")
///         .borderedCaption()
///
/// ![A screenshot showing the image of a bus with a caption reading
/// Downtown Bus. A view extension, using custom a modifier, renders the
///  caption in blue text surrounded by a rounded
///  rectangle.](OpenSwiftUI-View-ViewModifier.png)
@MainActor
public protocol ViewModifier {

    // MARK: - Associated Type(s).
    /// The type of view representing the body.
    associatedtype Body : View

    // MARK: - Type Alias.
    /// The content view type passed to `body()`.
    typealias Content = _ViewModifier_Content<Self>

    // MARK: - Public Function(s).
    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @ViewBuilder func body(content: Self.Content) -> Self.Body

    /// Builds the view outputs for this modifier within the attribute graph.
    ///
    /// - Parameters:
    ///   - modifier: The graph value wrapping this modifier instance.
    ///   - inputs: The view inputs propagated from the parent context.
    ///   - body: A closure that builds the outputs for the modified content.
    /// - Returns: The `_ViewOutputs` produced by the modifier.
    static func _makeView(
        modifier: _GraphValue<Self>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs
}

extension ViewModifier where Self.Body == Never {

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    public func body(content: Self.Content) -> Self.Body {
        fatalError("not implemented yet")
    }

    public static func _makeView(
        modifier: _GraphValue<Self>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        // guard let graph = _GraphContext.current else {
        //     fatalError("ViewModifier._makeView called outside of _GraphContext.withGraph")
        // }
        // let bodyAttr = graph.rule(name: "\(Self.self).body") {
        //     modifier.wrappedValue.body(
        //         content: _ViewModifier_Content(
        //             modifierAttr: modifier.wrappedValue,
        //             contentBody: contentBody
        //         )
        //     )
        // }
        // return Body._makeView(view: _GraphValue(attribute: bodyAttr), inputs: inputs)

        fatalError("not implemented yet")
    }
}

extension ViewModifier {

    /// Returns a new modifier that is the result of concatenating
    /// `self` with `modifier`.
    @inlinable public func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(content: self, modifier: modifier)
    }
}
