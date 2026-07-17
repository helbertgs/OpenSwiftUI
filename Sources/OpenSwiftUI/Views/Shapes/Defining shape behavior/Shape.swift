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
    nonisolated func sizeThatFits(_ proposal: ProposedViewSize) -> Size3D

    /// Describes this shape as a path within a rectangular frame of reference.
    /// 
    /// - Parameters:
    ///   - rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    nonisolated func path(in rect: Rect3D) -> Path

    // MARK: - Setting the role

    /// An indication of how to style a shape.
    /// 
    /// OpenSwiftUI looks at a shape’s role when deciding how to apply a ``ShapeStyle`` at render time. 
    /// The ``Shape`` protocol provides a default implementation with a value of ``ShapeRole.fill``.
    /// If you create a composite shape, you can provide an override of this property to return another value, if appropriate.
    nonisolated static var role: ShapeRole { get }

    // MARK: - Indicating a layout direction

    /// Returns the behavior this shape should use for different layout directions.
    /// 
    /// If the ``layoutDirectionBehavior`` for a ``Shape`` is one that mirrors, the shape’s path will be mirrored horizontally when in the specified layout direction. 
    /// When mirrored, the individual points of the path will be transformed.
    /// 
    /// Defaults ``.mirrors`` 
    /// To mirror a path when deploying to earlier releases, either use ``View.flipsForRightToLeftLayoutDirection`` for a filled or stroked shape or conditionally mirror the points in the path of the shape.
    nonisolated var layoutDirectionBehavior: LayoutDirectionBehavior { get }
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
    nonisolated public func sizeThatFits(_ proposal: ProposedViewSize) -> Size3D {
        guard let width = proposal.width, let height = proposal.height else {
            return .zero
        }
        
        return .init(width: width, height: height, depth: 0)
    }
}

extension Shape {
    
    /// An indication of how to style a shape.
    /// 
    /// OpenSwiftUI looks at a shape’s role when deciding how to apply a ``ShapeStyle`` at render time. 
    /// The ``Shape`` protocol provides a default implementation with a value of ``ShapeRole.fill``.
    /// If you create a composite shape, you can provide an override of this property to return another value, if appropriate.
    nonisolated public static var role: ShapeRole {
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
    nonisolated public var layoutDirectionBehavior: LayoutDirectionBehavior {
        .mirrors
    }
}