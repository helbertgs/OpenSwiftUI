//
// Circle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A circle centered on the frame of the view containing it.
///
/// The circle's radius equals half the length of the frame rectangle's smallest edge.
@frozen
public struct Circle : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: Rect3D) -> Path {
        .init(ellipseIn: rect)
    }

    /// Creates a new circle shape.
    @inlinable public init() {
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

extension Circle {

    /// Returns the size of the view that will render the shape, given
    /// a proposed size.
    ///
    /// Implement this method to tell the container of the shape how
    /// much space the shape needs to render itself, given a size
    /// proposal.
    ///
    /// See ``Layout/sizeThatFits(proposal:subviews:cache:)``
    /// for more details about how the layout system chooses the size of
    /// views.
    ///
    /// - Parameters:
    ///   - proposal: A size proposal for the container.
    ///
    /// - Returns: A size that indicates how much space the shape needs.
    public func sizeThatFits(_ proposal: ProposedViewSize) -> Size3D {
        proposal.replacingUnspecifiedDimensions()
    }
}

extension Circle : InsettableShape {

    /// Returns `self` inset by `amount`.
    public func inset(by amount: Double) -> some InsettableShape {
        _Inset(amount: amount)
    }

    struct _Inset : InsettableShape {

        var amount: Double

        init(amount: Double) {
            self.amount = amount
        }

        func path(in rect: Rect3D) -> Path {
            .init(roundedRect: rect, cornerSize: .zero)
        }

        var layoutDirectionBehavior: LayoutDirectionBehavior {
            .mirrors(in: .leftToRight)
        }

        func inset(by amount: Double) -> Circle._Inset {
            var copy = self
            copy.amount += amount
            return copy
        }

        typealias Body = _ShapeView<Circle._Inset, ForegroundStyle>
        typealias InsetShape = Circle._Inset
    }
}

extension Circle : RoundedRectangularShape {

    /// Resolved corners given a size. If the corner style of a shape is
    /// size-dependent, read the provided size and return values accordingly.
    /// This function could be called with a nil size when the size hasn't been
    /// determined. In that case, return the best approximated value.
    /// For example, for a capsule shape, its corner radius is determined by the
    /// size. If size is not available, return `.fixed(.infinity)` to indicate
    /// that the corner should be as round as it could be.
    public func corners(in size: Size3D?) -> Circle.Corners? {
        nil
    }
}
