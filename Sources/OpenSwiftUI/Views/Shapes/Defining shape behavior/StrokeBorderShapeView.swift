//
// StrokeBorderShapeView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

/// A shape provider that strokes the border of its shape.
///
/// You don't create this type directly; it's the return type of
/// `Shape.strokeBorder`.
@frozen public struct StrokeBorderShapeView<Content, Style, Background> where Content : InsettableShape, Style : ShapeStyle, Background : View {

    /// The shape that this type draws and provides for other drawing
    /// operations.
    public var shape: Content

    /// The style that strokes the border of this view's shape.
    public var style: Style

    /// The stroke style used when stroking this view's shape.
    public var strokeStyle: StrokeStyle

    /// Whether this shape should be drawn antialiased.
    public var isAntialiased: Bool

    /// The background shown beneath this view.
    public var background: Background

    /// Create a stroke border shape.
    public init(shape: Content, style: Style, strokeStyle: StrokeStyle, isAntialiased: Bool, background: Background) {
        self.shape = shape
        self.style = style
        self.strokeStyle = strokeStyle
        self.isAntialiased = isAntialiased
        self.background = background
    }
}

extension StrokeBorderShapeView : ShapeView {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never
}
