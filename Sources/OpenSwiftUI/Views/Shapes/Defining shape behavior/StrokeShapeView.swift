//
// StrokeShapeView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

@frozen
public struct StrokeShapeView<Content, Style, Background> where Content : Shape, Style : ShapeStyle, Background : View {

    @usableFromInline
    typealias ViewType = ModifiedContent<_ShapeView<_StrokedShape<Content>, Style>, _BackgroundModifier<Background>>

    @usableFromInline
    var view: StrokeShapeView<Content, Style, Background>.ViewType

    public var shape: Content {
        get { view.content.shape.shape }
        set { view.content.shape.shape = newValue }
    }

    public var style: Style {
        get { view.content.style }
        set { view.content.style = newValue }
    }

    public var strokeStyle: StrokeStyle {
        get { view.content.shape.style }
        set { view.content.shape.style = newValue }
    }

    public var isAntialiased: Bool {
        get { view.content.fillStyle.isAntialiased }
        set { view.content.fillStyle.isAntialiased = newValue }
    }

    public var background: Background {
        get { view.modifier.background }
        set { view.modifier.background = newValue }
    }

    public init(shape: Content, style: Style, strokeStyle: StrokeStyle, isAntialiased: Bool, background: Background) {
        view = .init(
            content: _ShapeView(
                shape: _StrokedShape(shape: shape, style: strokeStyle),
                style: style, fillStyle: .init(antialiased: isAntialiased)
            ),
            modifier: .init(background: background)
        )
    }
}

extension StrokeShapeView : ShapeView {

    public typealias Body = Never

    public static func _makeView(
        view: _GraphValue<StrokeShapeView<Content, Style, Background>>,
        inputs: _ViewInputs
    ) -> _ViewOutputs {
        Self.ViewType._makeView(view: _GraphValue(value: view.wrappedValue.view), inputs: inputs)
    }
}
