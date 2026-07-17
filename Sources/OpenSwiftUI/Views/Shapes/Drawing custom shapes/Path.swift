//
// Path.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 01, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// The outline of a 2D shape.
public struct Path : Equatable, Sendable {

    // MARK: - Creating a path

    /// Creates an empty path.
    public init() {
        storage = .empty
        elements = []
    }

    /// Creates an empty path, then executes a closure to add its initial elements.
    /// 
    /// - Parameter callback: The Swift function that will be called to initialize the new path.
    public init(_ callback: (inout Path) -> ()) {
        storage = .empty
        elements = []

        callback(&self)
    }

    /// Creates a path as an ellipse within the given rectangle.
    /// 
    /// This is a convenience function that creates a path of an ellipse. 
    /// Using this convenience function is more efficient than creating a path and adding an ellipse to it.
    /// 
    /// The ellipse is approximated by a sequence of Bézier curves. 
    /// Its center is the midpoint of the rectangle defined by the rect parameter. 
    /// If the rectangle is square, then the ellipse is circular with a radius equal to one-half the width (or height) of the rectangle. 
    /// If the rect parameter specifies a rectangular shape, then the major and minor axes of the ellipse are defined by the width and height of the rectangle.
    /// 
    /// The ellipse forms a complete subpath of the path—that is, the ellipse drawing starts with a move-to operation and ends with a close-subpath operation, with all moves oriented in the clockwise direction. 
    /// If you supply an affine transform, then the constructed Bézier curves that define the ellipse are transformed before they are added to the path.
    /// - Parameter rect: The rectangle that bounds the ellipse.
    public init(ellipseIn rect: Rect3D) {
        storage = .ellipse(rect)
        elements = []
    }

    /// Creates a path containing a rounded rectangle.
    /// 
    /// This is a convenience function that creates a path of a rounded rectangle. 
    /// Using this convenience function is more efficient than creating a path and adding a rounded rectangle to it.
    /// - Parameters:
    ///   - rect: A rectangle, specified in user space coordinates.
    ///   - cornerRadius: The radius of all corners of the rectangle, specified in user space coordinates.
    ///   - style: The corner style. Defaults to the continous style if not specified.
    public init(roundedRect rect: Rect3D, cornerRadius: Double, style: RoundedCornerStyle = .continuous) {
        storage = .roundedRect(.init(roundedRect: rect, cornerRadius: cornerRadius, style: style))
        elements = []
    }

    /// Creates a path containing a rounded rectangle.
    /// 
    /// This is a convenience function that creates a path of a rounded rectangle. 
    /// Using this convenience function is more efficient than creating a path and adding a rounded rectangle to it.
    /// - Parameters:
    ///   - rect: A rectangle, specified in user space coordinates.
    ///   - cornerSize: The size of the corners, specified in user space coordinates.
    ///   - style: The corner style. Defaults to the continous style if not specified.
    public init(roundedRect rect: Rect3D, cornerSize: Size3D, style: RoundedCornerStyle = .continuous) {
        storage = .roundedRect(.init(roundedRect: rect, cornerSize: cornerSize, style: style))
        elements = []
    }

    /// Creates a path as the given rounded rectangle, which may have uneven corner radii.
    /// 
    /// This is a convenience function that creates a path of a rounded rectangle. 
    /// Using this function is more efficient than creating a path and adding a rounded rectangle to it.
    /// - Parameters:
    ///   - rect: A rectangle, specified in user space coordinates.
    ///   - cornerRadii: The radius of each corner of the rectangle, specified in user space coordinates.
    ///   - style: The corner style. Defaults to the continous style if not specified.
    public init(roundedRect rect: Rect3D, cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous) {
        storage = .roundedRect(.init(roundedRect: rect, cornerRadii: cornerRadii, style: style))
        elements = []
    }

    // MARK: - Getting the path’s characteristics

    /// The storage for the path's data.
    package var storage: Storage

    /// The elements that make up the path.
    package var elements: [Element]

    /// A rectangle containing all path segments.
    /// 
    /// This is the smallest rectangle completely enclosing all points in the path but not including control points for Bézier curves.
    public var boundingRect: Rect3D = .zero
    
    /// Returns true if the path contains a specified point.
    /// 
    /// If eoFill is true, this method uses the even-odd rule to define which points are inside the path. 
    /// Otherwise, it uses the non-zero rule.
    public func contains(_ point: Point3D, eoFill: Bool = false) -> Bool {
        false
    }

    /// Returns the last point in the path, or nil if the path contains no points.
    public var currentPoint: Point3D?

    /// A description of the path that may be used to recreate the path via init?(_:).
    public var description: String = ""

    /// A Boolean value indicating whether the path contains zero elements.
    public var isEmpty: Bool {
        elements.isEmpty && storage == .empty
    }

    // MARK: - Drawing a path

    /// Begins a new subpath at the specified point.
    /// 
    /// The specified point becomes the start point of a new subpath. 
    /// The current point is set to this start point.
    /// - Parameter end: The point, in user space coordinates, at which to start a new subpath.
    public mutating func move(to end: Point3D) {
        elements.append(.move(to: end))
        currentPoint = end
    }

    /// Adds an arc of a circle to the path, specified with a radius and angles.
    /// 
    /// This method calculates starting and ending points using the radius and angles you specify, uses a sequence of cubic Bézier curves to approximate a segment of a circle between those points, and then appends those curves to the path.
    /// 
    /// The clockwise parameter determines the direction in which the arc is created; the actual direction of the final path is dependent on the transform parameter and the current transform of a context where the path is drawn. 
    /// However, because OpenSwiftUI by default uses a vertically-flipped coordinate system (with the origin in the top-left of the view), specifying a clockwise arc results in a counterclockwise arc after the transformation is applied.
    /// 
    /// If the path ends with an unclosed subpath, this method adds a line connecting the current point to the starting point of the arc. 
    /// If there is no unclosed subpath, this method creates a new subpath whose starting point is the starting point of the arc. 
    /// The ending point of the arc becomes the new current point of the path.
    /// - Parameters:
    ///   - center: The center of the arc, in user space coordinates.
    ///   - radius: The radius of the arc, in user space coordinates.
    ///   - startAngle: The angle to the starting point of the arc, measured from the positive x-axis.
    ///   - endAngle: The angle to the end point of the arc, measured from the positive x-axis.
    ///   - clockwise: True to make a clockwise arc; false to make a counterclockwise arc.
    ///   - transform: An affine transform to apply to the arc before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addArc(center: Point3D, radius: Double, startAngle: Angle2D, endAngle: Angle2D, clockwise: Bool, transform: AffineTransform3D = .identity) {
    }

    /// Adds an arc of a circle to the path, specified with a radius and two tangent lines.
    /// 
    /// This method calculates two tangent lines—the first from the current point to the tangent1End point, and the second from the tangent1End point to the tangent2End point—then calculates the start and end points for a circular arc of the specified radius such that the arc is tangent to both lines. 
    /// Finally, this method approximates that arc with a sequence of cubic Bézier curves and appends those curves to the path.
    /// 
    /// If the starting point of the arc (that is, the point where a circle of the specified radius must meet the first tangent line in order to also be tangent to the second line) is not the current point, this method appends a straight line segment from the current point to the starting point of the arc.
    /// 
    /// The ending point of the arc (that is, the point where a circle of the specified radius must meet the second tangent line in order to also be tangent to the first line) becomes the new current point of the path.
    /// - Parameters:
    ///   - tangent1End: The end point, in user space coordinates, for the first tangent line to be used in constructing the arc. (The start point for this tangent line is the path’s current point.)
    ///   - tangent2End: The end point, in user space coordinates, for the second tangent line to be used in constructing the arc. (The start point for this tangent line is the tangent1End point.)
    ///   - radius: The radius of the arc, in user space coordinates.
    ///   - transform: An affine transform to apply to the arc before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addArc(tangent1End: Point3D, tangent2End: Point3D, radius: Double, transform: AffineTransform3D = .identity) {
    }

    /// Adds a cubic Bézier curve to the path, with the specified end point and control points.
    /// 
    /// This method constructs a curve starting from the path’s current point and ending at the specified end point, with curvature defined by the two control points. 
    /// After this method appends that curve to the current path, the end point of the curve becomes the path’s current point.
    /// - Parameters:
    ///   - end: 
    ///   - control1: The first control point of the curve, in user space coordinates.
    ///   - control2: The first control point of the curve, in user space coordinates.
    public mutating func addCurve(to end: Point3D, control1: Point3D, control2: Point3D) {
        elements.append(.curve(to: end, control1: control1, control2: control2))
        currentPoint = end
    }

    /// Adds an ellipse that fits inside the specified rectangle to the path.
    /// 
    /// The ellipse is approximated by a sequence of Bézier curves. 
    /// Its center is the midpoint of the rectangle defined by the rect parameter. 
    /// If the rectangle is square, then the ellipse is circular with a radius equal to one-half the width (or height) of the rectangle. 
    /// If the rect parameter specifies a rectangular shape, then the major and minor axes of the ellipse are defined by the width and height of the rectangle.
    /// 
    /// The ellipse forms a complete subpath of the path— that is, the ellipse drawing starts with a move-to operation and ends with a close-subpath operation, with all moves oriented in the clockwise direction.
    /// - Parameters:
    ///   - rect: A rectangle that defines the area for the ellipse to fit in.
    ///   - transform: An affine transform to apply to the ellipse before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addEllipse(in rect: Rect3D, transform: AffineTransform3D = .identity) {
    }

    /// Appends a straight line segment from the current point to the specified point.
    /// 
    /// After adding the line segment, the current point is set to the endpoint of the line segment.
    /// - Parameters:
    ///   - end: The location, in user space coordinates, for the end of the new line segment.
    ///   - transform: An affine transform to apply to the points before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addLine(to end: Point3D, transform: AffineTransform3D = .identity) {
        elements.append(.line(to: end))
        currentPoint = end
    }

    /// Adds a sequence of connected straight-line segments to the path.
    /// 
    /// Calling this convenience method is equivalent to applying the transform to all points in the array, then calling the ``move(to:)`` method with the first value in the points array, then calling the ``addLine(to:)`` method for each subsequent point until the array is exhausted. 
    /// After calling this method, the path’s current point is the last point in the array.
    /// - Parameters:
    ///   - lines: An array of values that specify the start and end points of the line segments to draw. Each point in the array specifies a position in user space. The first point in the array specifies the initial starting point.
    ///   - transform: An affine transform to apply to the points before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addLines(_ lines: [Point3D], transform: AffineTransform3D = .identity) {
        if let first = lines.first {
            move(to: first)
            for point in lines.dropFirst() {
                addLine(to: point)
            }
        }

        if let last = lines.last {
            currentPoint = last
        }
    }

    /// Appends another path value to this path.
    /// 
    /// If the path parameter is a non-empty empty path, its elements are appended in order to this path. 
    /// Afterward, the start point and current point of this path are those of the last subpath in the path parameter.
    /// - Parameters:
    ///   - path: The path to add.
    ///   - transform: An affine transform to apply to the path parameter before adding to this path. Defaults to the identity transform if not specified.
    public mutating func addPath(_ path: Path, transform: AffineTransform3D = .identity) {
        elements.append(contentsOf: path.elements)
        currentPoint = path.currentPoint
    }

    /// Adds a quadratic Bézier curve to the path, with the specified end point and control point.
    /// 
    /// This method constructs a curve starting from the path’s current point and ending at the specified end point, with curvature defined by the control point. 
    /// After this method appends that curve to the current path, the end point of the curve becomes the path’s current point.
    /// - Parameters:
    ///   - end: 
    ///   - control: The control point of the curve, in user space coordinates.
    public mutating func addQuadCurve(to end: Point3D, control: Point3D) {
    }

    /// Adds a rectangular subpath to the path.
    /// 
    /// This is a convenience function that adds a rectangle to a path, starting by moving to the bottom-left corner and then adding lines counter-clockwise to create a rectangle, closing the subpath.
    /// - Parameters:
    ///   - rect: A rectangle, specified in user space coordinates.
    ///   - transform: An affine transform to apply to the rectangle before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addRect(_ rect: Rect3D, transform: AffineTransform3D = .identity) {
    }

    /// Adds a set of rectangular subpaths to the path.
    /// 
    /// Calling this convenience method is equivalent to repeatedly calling the ``addRect(_:transform:)`` method for each rectangle in the array.
    /// - Parameters:
    ///   - rects: An array of rectangles, specified in user space coordinates.
    ///   - transform: An affine transform to apply to the ellipse before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addRects(_ rects: [Rect3D], transform: AffineTransform3D = .identity) {
    }

    /// Adds an arc of a circle to the path, specified with a radius and a difference in angle.
    /// 
    /// This method calculates starting and ending points using the radius and angles you specify, uses a sequence of cubic Bézier curves to approximate a segment of a circle between those points, and then appends those curves to the path.
    /// 
    /// The delta parameter determines both the length of the arc the direction in which the arc is created; the actual direction of the final path is dependent on the transform parameter and the current transform of a context where the path is drawn. 
    /// However, because OpenSwiftUI by default uses a vertically-flipped coordinate system (with the origin in the top-left of the view), specifying a clockwise arc results in a counterclockwise arc after the transformation is applied.
    /// 
    /// If the path ends with an unclosed subpath, this method adds a line connecting the current point to the starting point of the arc. 
    /// If there is no unclosed subpath, this method creates a new subpath whose starting point is the starting point of the arc. 
    /// The ending point of the arc becomes the new current point of the path.
    /// - Parameters:
    ///   - center: The center of the arc, in user space coordinates.
    ///   - radius: The radius of the arc, in user space coordinates.
    ///   - startAngle: The angle to the starting point of the arc, measured from the positive x-axis.
    ///   - delta: The difference between the starting angle and ending angle of the arc. A positive value creates a counter- clockwise arc (in user space coordinates), and vice versa.
    ///   - transform: An affine transform to apply to the arc before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addRelativeArc(center: Point3D, radius: Double, startAngle: Angle2D, delta: Angle2D, transform: AffineTransform3D = .identity) {
    }

    /// Adds a rounded rectangle to the path.
    /// 
    /// This is a convenience function that adds a rounded rectangle to a path, starting by moving to the center of the right edge and then adding lines and curves counter-clockwise to create a rounded rectangle, closing the subpath.
    /// - Parameters:
    ///   - rect: A rectangle, specified in user space coordinates.
    ///   - cornerSize: The size of the corners, specified in user space coordinates.
    ///   - style: The corner style. Defaults to the continous style if not specified.
    ///   - transform: An affine transform to apply to the rectangle before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addRoundedRect(in rect: Rect3D, cornerSize: Size3D, style: RoundedCornerStyle = .continuous, transform: AffineTransform3D = .identity) {
    }

    /// Closes and completes the current subpath.
    /// 
    /// Appends a line from the current point to the starting point of the current subpath and ends the subpath.
    /// 
    /// After closing the subpath, your application can begin a new subpath without first calling ``move(to:)``. 
    /// In this case, a new subpath is implicitly created with a starting and current point equal to the previous subpath’s starting point.
    public mutating func closeSubpath() {
        elements.append(.closeSubpath)
    }

    // MARK: - Operating over path elements

    /// Calls body with each element in the path.
    public func forEach(_ body: (Path.Element) -> Void) {
        elements.forEach(body)
    }

    // MARK: - Applying a style

    /// Returns a stroked copy of the path using style to define how the stroked outline is created.
    /// 
    /// - Parameter style: 
    /// - Returns: 
    public func strokedPath(_ style: StrokeStyle) -> Path {
        .init()
    }

    // MARK: - Instance Methods

    /// Adds a rounded rectangle with uneven corners to the path.
    /// 
    /// This is a convenience function that adds a rounded rectangle to a path, starting by moving to the center of the right edge and then adding lines and curves counter-clockwise to create a rounded rectangle, closing the subpath.
    /// - Parameters:
    ///   - rect: A rectangle, specified in user space coordinates.
    ///   - cornerRadii: The radius of each corner of the rectangle, specified in user space coordinates.
    ///   - style: The corner style. Defaults to the continous style if not specified.
    ///   - transform: An affine transform to apply to the rectangle before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addRoundedRect(in rect: Rect3D, cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous, transform: AffineTransform3D = .identity) {
    }
}

extension Path {

    /// An element of a path.
    @frozen public enum Element : BitwiseCopyable, Copyable, Equatable, Sendable {

        // MARK: - Getting path elements
        
        /// A line from the start point of the current subpath (if any) to the current point, which terminates the subpath.
        case closeSubpath

        /// A cubic Bézier curve from the previous current point to the given end-point, using the two control points to define the curve.
        case curve(to: Point3D, control1: Point3D, control2: Point3D)

        /// A line from the previous current point to the given point, which becomes the new current point.
        case line(to: Point3D)

        /// A path element that terminates the current subpath (without closing it) and defines a new current point.
        case move(to: Point3D)

        /// A quadratic Bézier curve from the previous current point to the given end-point, using the single control point to define the curve.
        case quadCurve(to: Point3D, control: Point3D)
    }
}

extension Path {

    /// The storage for the path's data.
    @frozen package enum Storage : Equatable, Sendable {

        /// The different kinds of storage for a path.
        case empty

        /// A rectangle.
        case rect(Rect3D)

        /// An ellipse.
        case ellipse(Rect3D)

        /// A rounded rectangle.
        indirect case roundedRect(FixedRoundedRect)

        /// A custom path.
        indirect case path(Path.PathBox)
    }
}

extension Path {

    /// A box that holds a Path value for storage in Path.Storage.
    package final class PathBox : Equatable, Sendable {

        /// The path stored in the box.
        package let path: Path

        /// Creates a box that holds the given path.
        /// 
        /// - Parameter path: The path to store in the box.
        package init(_ path: Path) {
            self.path = path
        }

        /// Returns true if two PathBox values contain equal paths.
        /// 
        /// - Parameters:
        ///   - lhs: The left-hand side value to compare.
        ///   - rhs: The right-hand side value to compare.
        /// - Returns: True if the two values are equal; otherwise, false.
        package static func == (lhs: PathBox, rhs: PathBox) -> Bool {
            lhs.path == rhs.path
        }
    }
}