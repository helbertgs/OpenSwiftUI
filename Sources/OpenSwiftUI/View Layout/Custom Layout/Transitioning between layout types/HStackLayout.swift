//
// HStackLayout.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A horizontal container that you can use in conditional layouts.
///
/// This layout container behaves like an ``HStack``, but conforms to the
/// ``Layout`` protocol so you can use it in the conditional layouts that you
/// construct with ``AnyLayout``. If you don't need a conditional layout, use
/// ``HStack`` instead.
@frozen public struct HStackLayout {

    /// The vertical alignment of subviews.
    public var alignment: VerticalAlignment

    /// The distance between adjacent subviews.
    ///
    /// Set this value to `nil` to use default distances between subviews.
    public var spacing: Double?

    /// Creates a horizontal stack with the specified spacing and vertical
    /// alignment.
    ///
    /// - Parameters:
    ///     - alignment: The guide for aligning the subviews in this stack. It
    ///       has the same vertical screen coordinate for all subviews.
    ///     - spacing: The distance between adjacent subviews. Set this value
    ///       to `nil` to use default distances between subviews.
    @inlinable public init(alignment: VerticalAlignment = .center, spacing: Double? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
}

extension HStackLayout : Layout {

    /// Returns the size of the composite view, given a proposed size
    /// and the view's subviews.
    ///
    /// Implement this method to tell your custom layout container's parent
    /// view how much space the container needs for a set of subviews, given
    /// a size proposal. The parent might call this method more than once
    /// during a layout pass with different proposed sizes to test the
    /// flexibility of the container, using proposals like:
    ///
    /// * The ``ProposedViewSize/zero`` proposal; respond with the
    ///   layout's minimum size.
    /// * The ``ProposedViewSize/infinity`` proposal; respond with the
    ///   layout's maximum size.
    /// * The ``ProposedViewSize/unspecified`` proposal; respond with the
    ///   layout's ideal size.
    ///
    /// The parent might also choose to test flexibility in one dimension at a
    /// time. For example, a horizontal stack might propose a fixed height and
    /// an infinite width, and then the same height with a zero width.
    ///
    /// The following example calculates the size for a basic vertical stack
    /// that places views in a column, with no spacing between the views:
    ///
    ///     private struct BasicVStack: Layout {
    ///         func sizeThatFits(
    ///             proposal: ProposedViewSize,
    ///             subviews: Subviews,
    ///             cache: inout ()
    ///         ) -> CGSize {
    ///             subviews.reduce(CGSize.zero) { result, subview in
    ///                 let size = subview.sizeThatFits(.unspecified)
    ///                 return CGSize(
    ///                     width: max(result.width, size.width),
    ///                     height: result.height + size.height)
    ///             }
    ///         }
    ///
    ///         // This layout also needs a placeSubviews() implementation.
    ///     }
    ///
    /// The implementation asks each subview for its ideal size by calling the
    /// ``LayoutSubview/sizeThatFits(_:)`` method with an
    /// ``ProposedViewSize/unspecified`` proposed size.
    /// It then reduces these values into a single size that represents
    /// the maximum subview width and the sum of subview heights.
    /// Because this example isn't flexible, it ignores its size proposal
    /// input and always returns the same value for a given set of subviews.
    ///
    /// OpenSwiftUI views choose their own size, so the layout engine always
    /// uses a value that you return from this method as the actual size of the
    /// composite view. That size factors into the construction of the `bounds`
    /// input to the ``placeSubviews(in:proposal:subviews:cache:)`` method.
    ///
    /// - Parameters:
    ///   - proposal: A size proposal for the container. The container's parent
    ///     view that calls this method might call the method more than once
    ///     with different proposals to learn more about the container's
    ///     flexibility before deciding which proposal to use for placement.
    ///   - subviews: A collection of proxies that represent the
    ///     views that the container arranges. You can use the proxies in the
    ///     collection to get information about the subviews as you determine
    ///     how much space the container needs to display them.
    ///   - cache: Optional storage for calculated data that you can share among
    ///     the methods of your custom layout container. See
    ///     ``makeCache(subviews:)-23agy`` for details.
    ///
    /// - Returns: A size that indicates how much space the container
    ///   needs to arrange its subviews.
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> Size3D {
        proposal.replacingUnspecifiedDimensions()
    }

    /// Assigns positions to each of the layout's subviews.
    ///
    /// OpenSwiftUI calls your implementation of this method to tell your
    /// custom layout container to place its subviews. From this method, call
    /// the ``LayoutSubview/place(at:anchor:proposal:)`` method on each
    /// element in `subviews` to tell the subviews where to appear in the
    /// user interface.
    ///
    /// For example, you can create a basic vertical stack that places views
    /// in a column, with views horizontally aligned on their leading edge:
    ///
    ///     struct BasicVStack: Layout {
    ///         func placeSubviews(
    ///             in bounds: CGRect,
    ///             proposal: ProposedViewSize,
    ///             subviews: Subviews,
    ///             cache: inout ()
    ///         ) {
    ///             var point = bounds.origin
    ///             for subview in subviews {
    ///                 subview.place(at: point, anchor: .topLeading, proposal: .unspecified)
    ///                 point.y += subview.dimensions(in: .unspecified).height
    ///             }
    ///         }
    ///
    ///         // This layout also needs a sizeThatFits() implementation.
    ///     }
    ///
    /// The example creates a placement point that starts at the origin of the
    /// specified `bounds` input and uses that to place the first subview. It
    /// then moves the point in the y dimension by the subview's height,
    /// which it reads using the ``LayoutSubview/dimensions(in:)`` method.
    /// This prepares the point for the next iteration of the loop. All
    /// subview operations use an ``ProposedViewSize/unspecified`` size
    /// proposal to indicate that subviews should use and report their ideal
    /// size.
    ///
    /// A more complex layout container might add space between subviews
    /// according to their ``LayoutSubview/spacing`` preferences, or a
    /// fixed space based on input configuration. For example, you can extend
    /// the basic vertical stack's placement method to calculate the
    /// preferred distances between adjacent subviews and store the results in
    /// an array:
    ///
    ///     let spacing: [CGFloat] = subviews.indices.dropLast().map { index in
    ///         subviews[index].spacing.distance(
    ///             to: subviews[index + 1].spacing,
    ///             along: .vertical)
    ///     }
    ///
    /// The spacing's ``ViewSpacing/distance(to:along:)`` method considers the
    /// preferences of adjacent views on the edge where they meet. It returns
    /// the smallest distance that satisfies both views' preferences for the
    /// given edge. For example, if one view prefers at least `2` points on its
    /// bottom edge, and the next view prefers at least `8` points on its top
    /// edge, the distance method returns `8`, because that's the smallest
    /// value that satisfies both preferences.
    ///
    /// Update the placement calculations to use the spacing values:
    ///
    ///     var point = bounds.origin
    ///     for (index, subview) in subviews.enumerated() {
    ///         if index > 0 { point.y += spacing[index - 1] } // Add spacing.
    ///         subview.place(at: point, anchor: .topLeading, proposal: .unspecified)
    ///         point.y += subview.dimensions(in: .unspecified).height
    ///     }
    ///
    /// Be sure that you use computations during placement that are consistent
    /// with those in your implementation of other protocol methods for a given
    /// set of inputs. For example, if you add spacing during placement,
    /// make sure your implementation of
    /// ``sizeThatFits(proposal:subviews:cache:)`` accounts for the extra space.
    /// Similarly, if the sizing method returns different values for different
    /// size proposals, make sure the placement method responds to its
    /// `proposal` input in the same way.
    ///
    /// - Parameters:
    ///   - bounds: The region that the container view's parent allocates to the
    ///     container view, specified in the parent's coordinate space.
    ///     Place all the container's subviews within the region.
    ///     The size of this region matches a size that your container
    ///     previously returned from a call to the
    ///     ``sizeThatFits(proposal:subviews:cache:)`` method.
    ///   - proposal: The size proposal from which the container generated the
    ///     size that the parent used to create the `bounds` parameter.
    ///     The parent might propose more than one size before calling the
    ///     placement method, but it always uses one of the proposals and the
    ///     corresponding returned size when placing the container.
    ///   - subviews: A collection of proxies that represent the
    ///     views that the container arranges. Use the proxies in the collection
    ///     to get information about the subviews and to tell the subviews
    ///     where to appear.
    ///   - cache: Optional storage for calculated data that you can share among
    ///     the methods of your custom layout container. See
    ///     ``makeCache(subviews:)-23agy`` for details.
    public func placeSubviews(in bounds: Rect3D, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
    }
}

//extension HStackLayout : Animatable {
//
//    /// The type defining the data to animate.
//    public typealias AnimatableData = EmptyAnimatableData
//}

extension HStackLayout: _VariadicView_Root {
}
