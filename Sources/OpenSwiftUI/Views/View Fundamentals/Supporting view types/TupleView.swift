//
// TupleView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// A View created from a swift tuple of View values.
@frozen public struct TupleView<T> : View {

    // MARK: - Type Alias.

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    // MARK: - Public Property(ies).
    public var value: T

    // MARK: - Constructor(s).
    @inlinable public init(_ value: T) {
        self.value = value
    }

    /// Builds the view outputs for this view within the attribute graph.
    ///
    /// - Parameters:
    ///   - view: The graph value wrapping this view instance.
    ///   - inputs: The view inputs propagated from the parent context.
    /// - Returns: The `_ViewOutputs` produced for this view.
    public static func _makeView(view: _GraphValue<TupleView<T>>, inputs: _ViewInputs) -> _ViewOutputs {
        guard let graph = _GraphContext.current else {
            fatalError("TupleView._makeView called outside of _GraphContext.withGraph")
        }
        var outputs = _ViewOutputs()
        let tuple = view.wrappedValue.value
        let mirror = Mirror(reflecting: tuple)
        for (i, child) in mirror.children.enumerated() {
            guard let childView = child.value as? any View else { continue }
            let childOutputs = _makeChildView(childView, index: i, graph: graph, inputs: inputs)
            outputs.viewList.append(contentsOf: childOutputs.viewList)
            if let ps = childOutputs.preferenceStore {
                if outputs.preferenceStore == nil {
                    outputs.preferenceStore = ps
                } else {
                    let existing = outputs.preferenceStore!
                    outputs.preferenceStore = graph.rule(name: "TupleView.merge[\(i)]") {
                        var merged = existing.wrappedValue
                        merged.merge(ps.wrappedValue)
                        return merged
                    }
                }
            }
        }
        return outputs
    }

    /// Type-erases the dispatch to `V._makeView` so `TupleView._makeView` can call it
    /// for an `any View` without knowing the concrete type statically.
    @MainActor
    private static func _makeChildView<V: View>(_ view: V, index: Int, graph: AttributeGraph, inputs: _ViewInputs) -> _ViewOutputs {
        let attribute = graph.rule(name: "\(V.self)[\(index)]") { view }
        return V._makeView(view: _GraphValue(attribute: attribute), inputs: inputs)
    }
}
