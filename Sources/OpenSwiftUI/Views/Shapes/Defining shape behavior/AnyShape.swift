//
// FillShapeView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A type-erased shape value.
///
/// You can use this type to dynamically switch between shape types:
///
///     struct MyClippedView: View {
///         var isCircular: Bool
///
///         var body: some View {
///             OtherView().clipShape(isCircular ?
///                 AnyShape(Circle()) : AnyShape(Capsule()))
///         }
///     }
///
public struct AnyShape : Shape, @unchecked Sendable {

    let storage: AnyShapeBox

    /// Create an any shape instance from a shape.
    public init<S>(_ shape: S) where S : Shape {
        storage = _AnyShapeBox(shape: shape)
    }

    public init<S>(erasing shape: S) where S : Shape {
        self.init(shape)
    }

    public init?(_fromValue value: Any) {
        storage = _AnyShapeBox(shape: Rectangle())
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: Rect3D) -> Path {
        storage.path(in: rect)
    }

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
        storage.sizeThatFits(proposal)
    }

    // MARK: - Indicating a layout direction

    /// Returns the behavior this shape should use for different layout directions.
    ///
    /// If the ``layoutDirectionBehavior`` for a ``Shape`` is one that mirrors, the shape’s path will be mirrored horizontally when in the specified layout direction.
    /// When mirrored, the individual points of the path will be transformed.
    ///
    /// Defaults ``.mirrors``
    /// To mirror a path when deploying to earlier releases, either use ``View.flipsForRightToLeftLayoutDirection`` for a filled or stroked shape or conditionally mirror the points in the path of the shape.
    public var layoutDirectionBehavior: LayoutDirectionBehavior {
        storage.layoutDirectionBehavior
    }
}

extension AnyShape {

    class AnyShapeBox : Shape {

        // MARK: - Defining a shape’s size and path

        /// Returns the size of the view that will render the shape, given a proposed size.
        ///
        /// Implement this method to tell the container of the shape how much space the shape needs to render itself, given a size proposal.
        ///
        /// See ``sizeThatFits(proposal:subviews:cache:)`` for more details about how the layout system chooses the size of views.
        /// - Parameters:
        ///   - proposal: A size proposal for the container.
        /// - Returns: A size that indicates how much space the shape needs.
        func sizeThatFits(_ proposal: ProposedViewSize) -> Size3D {
            proposal.replacingUnspecifiedDimensions()
        }

        /// Describes this shape as a path within a rectangular frame of reference.
        ///
        /// - Parameters:
        ///   - rect: The frame of reference for describing this shape.
        /// - Returns: A path that describes this shape.
        func path(in rect: Rect3D) -> Path {
            .init(roundedRect: rect, cornerSize: .zero)
        }

        // MARK: - Indicating a layout direction

        /// Returns the behavior this shape should use for different layout directions.
        ///
        /// If the ``layoutDirectionBehavior`` for a ``Shape`` is one that mirrors, the shape’s path will be mirrored horizontally when in the specified layout direction.
        /// When mirrored, the individual points of the path will be transformed.
        ///
        /// Defaults ``.mirrors``
        /// To mirror a path when deploying to earlier releases, either use ``View.flipsForRightToLeftLayoutDirection`` for a filled or stroked shape or conditionally mirror the points in the path of the shape.
        var layoutDirectionBehavior: LayoutDirectionBehavior {
            .mirrors(in: .leftToRight)
        }
    }

    class _AnyShapeBox<S> : AnyShapeBox where S : Shape {
        let shape : S

        init(shape: S) {
            self.shape = shape
        }

        // MARK: - Defining a shape’s size and path

        /// Returns the size of the view that will render the shape, given a proposed size.
        ///
        /// Implement this method to tell the container of the shape how much space the shape needs to render itself, given a size proposal.
        ///
        /// See ``sizeThatFits(proposal:subviews:cache:)`` for more details about how the layout system chooses the size of views.
        /// - Parameters:
        ///   - proposal: A size proposal for the container.
        /// - Returns: A size that indicates how much space the shape needs.
        override func sizeThatFits(_ proposal: ProposedViewSize) -> Size3D {
            shape.sizeThatFits(proposal)
        }

        /// Describes this shape as a path within a rectangular frame of reference.
        ///
        /// - Parameters:
        ///   - rect: The frame of reference for describing this shape.
        /// - Returns: A path that describes this shape.
        override func path(in rect: Rect3D) -> Path {
            shape.path(in: rect)
        }

        // MARK: - Setting the role

        /// An indication of how to style a shape.
        ///
        /// OpenSwiftUI looks at a shape’s role when deciding how to apply a ``ShapeStyle`` at render time.
        /// The ``Shape`` protocol provides a default implementation with a value of ``ShapeRole.fill``.
        /// If you create a composite shape, you can provide an override of this property to return another value, if appropriate.
        static var role: ShapeRole {
            S.role
        }

        // MARK: - Indicating a layout direction

        /// Returns the behavior this shape should use for different layout directions.
        ///
        /// If the ``layoutDirectionBehavior`` for a ``Shape`` is one that mirrors, the shape’s path will be mirrored horizontally when in the specified layout direction.
        /// When mirrored, the individual points of the path will be transformed.
        ///
        /// Defaults ``.mirrors``
        /// To mirror a path when deploying to earlier releases, either use ``View.flipsForRightToLeftLayoutDirection`` for a filled or stroked shape or conditionally mirror the points in the path of the shape.
        override var layoutDirectionBehavior: LayoutDirectionBehavior {
            shape.layoutDirectionBehavior
        }
    }
}
