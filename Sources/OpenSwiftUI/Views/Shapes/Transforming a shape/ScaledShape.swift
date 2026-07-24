//
// ScaledShape.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A shape with a scale transform applied to it.
@frozen public struct ScaledShape<Content> : Shape where Content : Shape {

    // MARK: - Getting the shape’s characteristics

    public var shape: Content

    public var scale: Size3D

    public var anchor: UnitPoint

    // MARK: - Creating a scaled shape

    @inlinable public init(shape: Content, scale: Size3D, anchor: UnitPoint = .center) {
        self.shape = shape
        self.scale = scale
        self.anchor = anchor
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: Rect3D) -> Path {
        shape.path(in: rect.scaled(by: scale))
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
}
