//
// TransformedShape.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A shape with an affine transform applied to it.
@frozen
public struct TransformedShape<Content> : Shape where Content : Shape {

    public var shape: Content

    public var transform: AffineTransform3D

    @inlinable
    public init(shape: Content, transform: AffineTransform3D) {
        self.shape = shape
        self.transform = transform

    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: Rect3D) -> Path {
        shape.path(in: rect)
    }

    /// An indication of how to style a shape.
    ///
    /// SwiftUI looks at a shape's role when deciding how to apply a
    /// ``ShapeStyle`` at render time. The ``Shape`` protocol provides a
    /// default implementation with a value of ``ShapeRole/fill``. If you
    /// create a composite shape, you can provide an override of this property
    /// to return another value, if appropriate.
    public static var role: ShapeRole {
        Content.role
    }

    /// Returns the behavior this shape should use for different layout
    /// directions.
    ///
    /// If the layoutDirectionBehavior for a Shape is one that mirrors, the
    /// shape's path will be mirrored horizontally when in the specified layout
    /// direction. When mirrored, the individual points of the path will be
    /// transformed.
    ///
    /// Defaults to `.mirrors` when deploying on iOS 17.0, macOS 14.0,
    /// tvOS 17.0, watchOS 10.0 and later, and to `.fixed` if not.
    /// To mirror a path when deploying to earlier releases, either use
    /// `View.flipsForRightToLeftLayoutDirection` for a filled or stroked
    /// shape or conditionally mirror the points in the path of the shape.
    public var layoutDirectionBehavior: LayoutDirectionBehavior {
        shape.layoutDirectionBehavior
    }
}
