//
// RoundedRectangularShape.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A protocol of ``InsettableShape`` that describes a rounded rectangular
/// shape.
///
/// Conform your ``InsettableShape`` type to ``RoundedRectangularShape`` when
/// your shape is a rounded rectangular with four corners and you want to expose
/// information about the corners. For example, a custom triangle ``Shape`` is
/// not fit for such conformance, while a custom rectangle ``Shape`` could
/// benefit from providing the implementation, especially when the shape is used
/// as a container shape in
/// ``View/containerShape(_:)-(RoundedRectangularShape)`` to achieve
/// concentricity.
///
/// System shapes like ``Rectangle``, ``RoundedRectangle``,
/// ``UnevenRoundedRectangle``, ``Capsule``, and ``Circle`` already provide
/// default implementation for this protocol.
public protocol RoundedRectangularShape : InsettableShape {

    typealias Corners = RoundedRectangularShapeCorners

    /// Resolved corners given a size. If the corner style of a shape is
    /// size-dependent, read the provided size and return values accordingly.
    /// This function could be called with a nil size when the size hasn't been
    /// determined. In that case, return the best approximated value.
    /// For example, for a capsule shape, its corner radius is determined by the
    /// size. If size is not available, return `.fixed(.infinity)` to indicate
    /// that the corner should be as round as it could be.
    func corners(in size: Size3D?) -> Self.Corners?
}
