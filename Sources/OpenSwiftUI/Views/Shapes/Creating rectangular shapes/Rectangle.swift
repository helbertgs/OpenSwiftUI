//
// Rectangle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A rectangular shape aligned inside the frame of the view containing it.
@frozen
public struct Rectangle : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: Rect3D) -> Path {
        .init(roundedRect: rect, cornerSize: .zero)
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

    /// Creates a new rectangle shape.
    @inlinable public init() {
    }

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never
}

extension Rectangle : InsettableShape {

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

        func inset(by amount: Double) -> Rectangle._Inset {
            var copy = self
            copy.amount += amount
            return copy
        }

        typealias Body = _ShapeView<Rectangle._Inset, ForegroundStyle>
        typealias InsetShape = Rectangle._Inset
    }
}
