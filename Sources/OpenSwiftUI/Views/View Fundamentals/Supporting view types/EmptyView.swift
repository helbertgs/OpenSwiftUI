//
// EmptyView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A view that doesn't contain any content.
///
/// You will rarely, if ever, need to create an `EmptyView` directly. Instead,
/// `EmptyView` represents the absence of a view.
///
/// OpenSwiftUI uses `EmptyView` in situations where a OpenSwiftUI view type defines one
/// or more child views with generic parameters, and allows the child views to
/// be absent. When absent, the child view's type in the generic type parameter
/// is `EmptyView`.
///
/// The following example creates an indeterminate ``ProgressView`` without
/// a label. The ``ProgressView`` type declares two generic parameters,
/// `Label` and `CurrentValueLabel`, for the types used by its subviews.
/// When both subviews are absent, like they are here, the resulting type is
/// `ProgressView<EmptyView, EmptyView>`, as indicated by the example's output:
///
///     let progressView = ProgressView()
///     print("\(type(of:progressView))")
///     // Prints: ProgressView<EmptyView, EmptyView>
///
@frozen 
public struct EmptyView : Sendable, View {

    // MARK: - Type Alias.

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    // MARK: - Constructor(s).

    /// Creates an empty view.
    @inlinable public init() { }

    /// Builds the view outputs for this view within the attribute graph.
    ///
    /// - Parameters:
    ///   - view: The graph value wrapping this view instance.
    ///   - inputs: The view inputs propagated from the parent context.
    /// - Returns: The `_ViewOutputs` produced for this view.
    public static func _makeView(view: _GraphValue<EmptyView>, inputs: _ViewInputs) -> _ViewOutputs {
        guard let graph = _GraphContext.current else {
            fatalError("EmptyView._makeView called outside of _GraphContext.withGraph")
        }
        graph.input(name: "EmptyView", view.wrappedValue)
        let displayListAttr = graph.rule(name: "EmptyView.displayList") {
            DisplayList(
                /* instructions: [ .fillRect(inputs.frame.wrappedValue, color: .clear) ] */
            )
        }

        var outputs = _ViewOutputs()
        let identity = _ViewIdentity(type: ObjectIdentifier(Self.self), subgraphIndex: displayListAttr.index)
        outputs.viewList.append(_ViewListElement(id: identity, displayList: displayListAttr, name: "EmptyView"))

        return outputs
    }
}
