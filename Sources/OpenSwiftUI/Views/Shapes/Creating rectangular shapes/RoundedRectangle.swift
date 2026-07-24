//
// RoundedRectangle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A rectangular shape with rounded corners, aligned inside the frame of the
/// view containing it.
@frozen
public struct RoundedRectangle : Shape {

    /// The width and height of the rounded rectangle's corners.
    public var cornerSize: Size3D

    /// The style of corners drawn by the rounded rectangle.
    public var style: RoundedCornerStyle

    /// Creates a new rounded rectangle shape.
    ///
    /// - Parameters:
    ///   - cornerSize: the width and height of the rounded corners.
    ///   - style: the style of corners drawn by the shape.
    @inlinable
    public init(cornerSize: Size3D, style: RoundedCornerStyle = .continuous) {
        self.cornerSize = cornerSize
        self.style = style
    }

    /// Creates a new rounded rectangle shape.
    ///
    /// - Parameters:
    ///   - cornerRadius: the radius of the rounded corners.
    ///   - style: the style of corners drawn by the shape.
    @inlinable
    public init(cornerRadius: Double, style: RoundedCornerStyle = .continuous) {
        self.cornerSize = .init(width: cornerRadius, height: cornerRadius)
        self.style = style
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: Rect3D) -> Path {
        .init(
            roundedRect: rect,
            cornerSize: cornerSize,
            style: style
        )
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
        .mirrors(in: .leftToRight)
    }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never
}

extension RoundedRectangle : RoundedRectangularShape {

    /// Resolved corners given a size. If the corner style of a shape is
    /// size-dependent, read the provided size and return values accordingly.
    /// This function could be called with a nil size when the size hasn't been
    /// determined. In that case, return the best approximated value.
    /// For example, for a capsule shape, its corner radius is determined by the
    /// size. If size is not available, return `.fixed(.infinity)` to indicate
    /// that the corner should be as round as it could be.
    public func corners(in size: Size3D?) -> RoundedRectangle.Corners? {
        nil
    }
}


extension RoundedRectangle : InsettableShape {

    /// Returns `self` inset by `amount`.
    public func inset(by amount: Double) -> some InsettableShape {
        _Inset(
            base: self,
            amount: amount
        )
    }

    struct _Inset : InsettableShape {
        var base: RoundedRectangle
        var amount: Double

        init(base: RoundedRectangle, amount: Double) {
            (self.base, self.amount) = (base, amount)
        }

        func path(in rect: Rect3D) -> Path {
            base.path(in: rect)
        }

        var layoutDirectionBehavior: LayoutDirectionBehavior {
            .mirrors(in: .leftToRight)
        }

        func inset(by amount: Double) -> RoundedRectangle._Inset {
            var copy = self
            copy.amount += amount
            return copy
        }

        typealias Body = _ShapeView<RoundedRectangle._Inset, ForegroundStyle>
        typealias InsetShape = RoundedRectangle._Inset
    }
}
