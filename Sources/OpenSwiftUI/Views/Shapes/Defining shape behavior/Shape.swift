//
// Shape.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A 2D shape that you can use when drawing a view.
/// 
/// Shapes without an explicit fill or stroke get a default fill based on the foreground color.
/// 
/// You can define shapes in relation to an implicit frame of reference, such as the natural size of the view that contains it. 
/// Alternatively, you can define shapes in terms of absolute coordinates.
public protocol Shape {

    // MARK: - Defining a shape’s size and path

    /// Returns the size of the view that will render the shape, given a proposed size.
    /// 
    /// Implement this method to tell the container of the shape how much space the shape needs to render itself, given a size proposal.
    /// 
    /// See ``sizeThatFits(proposal:subviews:cache:)`` for more details about how the layout system chooses the size of views.
    /// - Parameters:
    ///   - proposal: A size proposal for the container.
    /// - Returns: A size that indicates how much space the shape needs.
    func sizeThatFits(_ proposal: ProposedViewSize) -> Size3D

    /// Describes this shape as a path within a rectangular frame of reference.
    /// 
    /// - Parameters:
    ///   - rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    func path(in rect: Rect3D) -> Path

    // MARK: - Setting the role

    /// An indication of how to style a shape.
    /// 
    /// OpenSwiftUI looks at a shape’s role when deciding how to apply a ``ShapeStyle`` at render time. 
    /// The ``Shape`` protocol provides a default implementation with a value of ``ShapeRole.fill``.
    /// If you create a composite shape, you can provide an override of this property to return another value, if appropriate.
    static var role: ShapeRole { get }

    // MARK: - Indicating a layout direction

    /// Returns the behavior this shape should use for different layout directions.
    /// 
    /// If the ``layoutDirectionBehavior`` for a ``Shape`` is one that mirrors, the shape’s path will be mirrored horizontally when in the specified layout direction. 
    /// When mirrored, the individual points of the path will be transformed.
    /// 
    /// Defaults ``.mirrors`` 
    /// To mirror a path when deploying to earlier releases, either use ``View.flipsForRightToLeftLayoutDirection`` for a filled or stroked shape or conditionally mirror the points in the path of the shape.
    var layoutDirectionBehavior: LayoutDirectionBehavior { get }
}

extension Shape {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public var body: some View {
        _ShapeView(
            shape: self,
            style: .foreground
        )
    }
}

extension Shape {
    
    /// Returns the size of the view that will render the shape, given a proposed size.
    /// 
    /// Implement this method to tell the container of the shape how much space the shape needs to render itself, given a size proposal.
    /// 
    /// See ``sizeThatFits(proposal:subviews:cache:)`` for more details about how the layout system chooses the size of views.
    /// - Parameters:
    ///   - proposal: A size proposal for the container.
    /// - Returns: A size that indicates how much space the shape needs.
    public func sizeThatFits(_ proposal: ProposedViewSize) -> Size3D {
        proposal.replacingUnspecifiedDimensions()
    }
}

extension Shape {
    
    /// An indication of how to style a shape.
    /// 
    /// OpenSwiftUI looks at a shape’s role when deciding how to apply a ``ShapeStyle`` at render time. 
    /// The ``Shape`` protocol provides a default implementation with a value of ``ShapeRole.fill``.
    /// If you create a composite shape, you can provide an override of this property to return another value, if appropriate.
    public static var role: ShapeRole {
        .fill
    }
}

extension Shape {
    
    /// Returns the behavior this shape should use for different layout directions.
    /// 
    /// If the ``layoutDirectionBehavior`` for a ``Shape`` is one that mirrors, the shape’s path will be mirrored horizontally when in the specified layout direction. 
    /// When mirrored, the individual points of the path will be transformed.
    /// 
    /// Defaults ``.mirrors`` 
    /// To mirror a path when deploying to earlier releases, either use ``View.flipsForRightToLeftLayoutDirection`` for a filled or stroked shape or conditionally mirror the points in the path of the shape.
    public var layoutDirectionBehavior: LayoutDirectionBehavior {
        .mirrors
    }
}

extension Shape {

    /// Returns a new shape that is a stroked copy of `self`, using the
    /// contents of `style` to define the stroke characteristics.
    public func stroke(style: StrokeStyle) -> some Shape {
        _StrokedShape(
            shape: self, 
            style: style
        )
    }

    /// Returns a new shape that is a stroked copy of `self` with
    /// line-width defined by `lineWidth` and all other properties of
    /// `StrokeStyle` having their default values.
    public func stroke(lineWidth: Double = 1) -> some Shape {
        _StrokedShape(
            shape: self, 
            style: .init(lineWidth: lineWidth)
        )
    }
}

extension Shape {

    /// Fills this shape with a color or gradient.
    ///
    /// - Parameters:
    ///   - content: The color or gradient to use when filling this shape.
    ///   - style: The style options that determine how the fill renders.
    /// - Returns: A shape filled with the color or gradient you supply.
    public func fill<S>(_ content: S, style: FillStyle = FillStyle()) -> some View where S : ShapeStyle {
        _ShapeView(
            shape: self,
            style: content,
            fillStyle: style
        )
    }

    /// Fills this shape with the foreground color.
    ///
    /// - Parameter style: The style options that determine how the fill
    ///   renders.
    /// - Returns: A shape filled with the foreground color.
    public func fill(style: FillStyle = FillStyle()) -> some View {
        _ShapeView(
            shape: self,
            style: .foreground,
            fillStyle: style
        )
    }

    /// Traces the outline of this shape with a color or gradient.
    ///
    /// The following example adds a dashed purple stroke to a `Capsule`:
    ///
    ///     Capsule()
    ///     .stroke(
    ///         Color.purple,
    ///         style: StrokeStyle(
    ///             lineWidth: 5,
    ///             lineCap: .round,
    ///             lineJoin: .miter,
    ///             miterLimit: 0,
    ///             dash: [5, 10],
    ///             dashPhase: 0
    ///         )
    ///     )
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - style: The stroke characteristics --- such as the line's width and
    ///     whether the stroke is dashed --- that determine how to render this
    ///     shape.
    /// - Returns: A stroked shape.
    public func stroke<S>(_ content: S, style: StrokeStyle) -> some View where S : ShapeStyle {
        _ShapeView(
            shape: stroke(style: style),
            style: content
        )
    }

    /// Traces the outline of this shape with a color or gradient.
    ///
    /// The following example draws a circle with a purple stroke:
    ///
    ///     Circle().stroke(Color.purple, lineWidth: 5)
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - lineWidth: The width of the stroke that outlines this shape.
    /// - Returns: A stroked shape.
    public func stroke<S>(_ content: S, lineWidth: Double = 1) -> some View where S : ShapeStyle {
        _ShapeView(
            shape: stroke(style: StrokeStyle(lineWidth: lineWidth)),
            style: content
        )
    }
}

extension Shape {

    /// Fills this shape with a color or gradient.
    ///
    /// - Parameters:
    ///   - content: The color or gradient to use when filling this shape.
    ///   - style: The style options that determine how the fill renders.
    /// - Returns: A shape filled with the color or gradient you supply.
    public func fill<S>(_ content: S = .foreground, style: FillStyle = FillStyle()) -> _ShapeView<Self, S> where S : ShapeStyle {
        _ShapeView(
            shape: self,
            style: content,
            fillStyle: style
        )
    }

    /// Traces the outline of this shape with a color or gradient.
    ///
    /// The following example adds a dashed purple stroke to a `Capsule`:
    ///
    ///     Capsule()
    ///     .stroke(
    ///         Color.purple,
    ///         style: StrokeStyle(
    ///             lineWidth: 5,
    ///             lineCap: .round,
    ///             lineJoin: .miter,
    ///             miterLimit: 0,
    ///             dash: [5, 10],
    ///             dashPhase: 0
    ///         )
    ///     )
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - style: The stroke characteristics --- such as the line's width and
    ///     whether the stroke is dashed --- that determine how to render this
    ///     shape.
    /// - Returns: A stroked shape.
    @MainActor
    public func stroke<S>(_ content: S, style: StrokeStyle, antialiased: Bool = true) -> StrokeShapeView<Self, S, EmptyView> where S : ShapeStyle {
        StrokeShapeView(
            shape: self,
            style: content,
            strokeStyle: style,
            isAntialiased: antialiased,
            background: EmptyView()
        )
    }

    /// Traces the outline of this shape with a color or gradient.
    ///
    /// The following example draws a circle with a purple stroke:
    ///
    ///     Circle().stroke(Color.purple, lineWidth: 5)
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - lineWidth: The width of the stroke that outlines this shape.
    /// - Returns: A stroked shape.
    @MainActor
    public func stroke<S>(_ content: S, lineWidth: Double = 1, antialiased: Bool = true) -> StrokeShapeView<Self, S, EmptyView> where S : ShapeStyle {
        stroke(
            content, style: StrokeStyle(lineWidth: lineWidth),
            antialiased: antialiased
        )
    }
}

extension Shape {

    /// Changes the relative position of this shape using the specified size.
    ///
    /// The following example renders two circles. It places one circle at its
    /// default position. The second circle is outlined with a stroke,
    /// positioned on top of the first circle and offset by 100 points to the
    /// left and 50 points below.
    ///
    ///     Circle()
    ///     .overlay(
    ///         Circle()
    ///         .offset(CGSize(width: -100, height: 50))
    ///         .stroke()
    ///     )
    ///
    /// - Parameter offset: The amount, in points, by which you offset the
    ///   shape. Negative numbers are to the left and up; positive numbers are
    ///   to the right and down.
    ///
    public func offset(_ offset: Size3D) -> OffsetShape<Self> {
        .init(
            shape: self,
            offset: offset
        )
    }

    /// Changes the relative position of this shape using the specified point.
    ///
    /// The following example renders two circles. It places one circle at its
    /// default position. The second circle is outlined with a stroke,
    /// positioned on top of the first circle and offset by 100 points to the
    /// left and 50 points below.
    ///
    ///     Circle()
    ///     .overlay(
    ///         Circle()
    ///         .offset(CGPoint(x: -100, y: 50))
    ///         .stroke()
    ///     )
    ///
    /// - Parameter offset: The amount, in points, by which you offset the
    ///   shape. Negative numbers are to the left and up; positive numbers are
    ///   to the right and down.
    ///
    /// - Returns: A shape offset by the specified amount.
    public func offset(_ offset: Point3D) -> OffsetShape<Self> {
        .init(
            shape: self,
            offset: Size3D(width: offset.x, height: offset.y)
        )
    }

    /// Changes the relative position of this shape using the specified point.
    ///
    /// The following example renders two circles. It places one circle at its
    /// default position. The second circle is outlined with a stroke,
    /// positioned on top of the first circle and offset by 100 points to the
    /// left and 50 points below.
    ///
    ///     Circle()
    ///     .overlay(
    ///         Circle()
    ///         .offset(x: -100, y: 50)
    ///         .stroke()
    ///     )
    ///
    /// - Parameters:
    ///   - x: The horizontal amount, in points, by which you offset the shape.
    ///     Negative numbers are to the left and positive numbers are to the
    ///     right.
    ///   - y: The vertical amount, in points, by which you offset the shape.
    ///     Negative numbers are up and positive numbers are down.
    ///
    /// - Returns: A shape offset by the specified amount.
    public func offset(x: Double = 0, y: Double = 0) -> OffsetShape<Self> {
        .init(
            shape: self,
            offset: .init(width: x, height: y)
        )
    }

    /// Scales this shape without changing its bounding frame.
    ///
    /// Both the `x` and `y` multiplication factors halve their respective
    /// dimension's size when set to `0.5`, maintain their existing size when
    /// set to `1`, double their size when set to `2`, and so forth.
    ///
    /// - Parameters:
    ///   - x: The multiplication factor used to resize this shape along its
    ///     x-axis.
    ///   - y: The multiplication factor used to resize this shape along its
    ///     y-axis.
    ///
    /// - Returns: A scaled form of this shape.
    public func scale(x: Double = 1, y: Double = 1, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        .init(
            shape: self,
            scale: Size3D(width: x, height: y)
            , anchor: anchor
        )
    }

    /// Scales this shape without changing its bounding frame.
    ///
    /// - Parameter scale: The multiplication factor used to resize this shape.
    ///   A value of `0` scales the shape to have no size, `0.5` scales to half
    ///   size in both dimensions, `2` scales to twice the regular size, and so
    ///   on.
    ///
    /// - Returns: A scaled form of this shape.
    public func scale(_ scale: Double, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        self.scale(x: scale, y: scale, anchor: anchor)
    }

    /// Rotates this shape around an anchor point at the angle you specify.
    ///
    /// The following example rotates a square by 45 degrees to the right to
    /// create a diamond shape:
    ///
    ///     RoundedRectangle(cornerRadius: 10)
    ///     .rotation(Angle(degrees: 45))
    ///     .aspectRatio(1.0, contentMode: .fit)
    ///
    /// - Parameters:
    ///   - angle: The angle of rotation to apply. Positive angles rotate
    ///     clockwise; negative angles rotate counterclockwise.
    ///   - anchor: The point to rotate the shape around.
    ///
    /// - Returns: A rotated shape.
    public func rotation(_ angle: Angle2D, anchor: UnitPoint = .center) -> RotatedShape<Self> {
        .init(
            shape: self,
            angle: angle,
            anchor: anchor
        )
    }

    /// Applies an affine transform to this shape.
    ///
    /// Affine transforms present a mathematical approach to applying
    /// combinations of rotation, scaling, translation, and skew to shapes.
    ///
    /// - Parameter transform: The affine transformation matrix to apply to this
    ///   shape.
    ///
    /// - Returns: A transformed shape, based on its matrix values.
    public func transform(_ transform: AffineTransform3D) -> TransformedShape<Self> {
        .init(
            shape: self,
            transform: transform
        )
    }
}
