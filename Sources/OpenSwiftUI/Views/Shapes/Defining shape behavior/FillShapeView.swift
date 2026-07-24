//
// FillShapeView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

/// A shape provider that fills its shape.
@frozen
public struct FillShapeView<Content, Style, Background> where Content : Shape, Style : ShapeStyle, Background : View {

    @usableFromInline
    typealias ViewType = ModifiedContent<_ShapeView<Content, Style>, _BackgroundModifier<Background>>

    @usableFromInline
    var view: FillShapeView<Content, Style, Background>.ViewType

    // MARK: - Getting shape view properties

    /// The shape that this type draws and provides for other drawing operations.
    public var shape: Content {
        get { view.content.shape }
        set { view.content.shape = newValue }
    }

    /// The style that fills this view’s shape.
    public var style: Style {
        get { view.content.style }
        set { view.content.style = newValue }
    }

    /// The fill style used when filling this view’s shape.
    public var fillStyle: FillStyle {
        get { view.content.fillStyle }
        set { view.content.fillStyle = newValue }
    }

    /// The background shown beneath this view.
    public var background: Background {
        get { view.modifier.background }
        set { view.modifier.background = newValue }
    }

    // MARK: - Creating a stroke shape view

    /// Create a FillShapeView.
    ///
    /// You do not create this type directly, it is the return type of Shape.fill.
    /// - Parameters:
    ///   - shape: The shape that this type draws and provides for other drawing operations.
    ///   - style: The style that fills this view’s shape.
    ///   - fillStyle: The fill style used when filling this view’s shape.
    ///   - background: The background shown beneath this view.
    public init(shape: Content, style: Style, fillStyle: FillStyle, background: Background) {
        view = .init(
            content: _ShapeView(
                shape: shape,
                style: style,
                fillStyle: fillStyle
            ),
            modifier: .init(
                background: background
            )
        )
    }
}

extension FillShapeView : ShapeView {
    public typealias Body = Never

    public static func _makeView(
        view: _GraphValue<FillShapeView<Content, Style, Background>>,
        inputs: _ViewInputs
    ) -> _ViewOutputs {
        Self.ViewType._makeView(view: _GraphValue(value: view.wrappedValue.view), inputs: inputs)
    }
}
