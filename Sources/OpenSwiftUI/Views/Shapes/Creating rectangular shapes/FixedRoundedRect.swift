//
// FixedRoundedRect.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A rectangular shape with individually configurable corner radii.
package struct FixedRoundedRect : Equatable, Sendable {

    /// The rectangle that defines the shape's frame.
    package let rect: Rect3D

    /// The radii for each corner of the rectangle.
    package let cornerRadii: RectangleCornerRadii

    /// The style of the rounded corners.
    package let style: RoundedCornerStyle

    /// Creates a fixed rounded rectangle.
    /// 
    /// - Parameters:
    ///   - rect: The rectangle that defines the shape's frame.
    ///   - cornerRadii: The radii for each corner of the rectangle.
    ///   - style: The style of the rounded corners.
    package init(roundedRect rect: Rect3D, cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous) {
        self.rect = rect
        self.cornerRadii = cornerRadii
        self.style = style
    }

    /// Creates a fixed rounded rectangle.
    /// 
    /// - Parameters:
    ///   - rect: The rectangle that defines the shape's frame.
    ///   - cornerRadius: The radius of all corners of the rectangle, specified in user space coordinates.
    ///   - style: The corner style. Defaults to the continuous style if not specified.
    package init(roundedRect rect: Rect3D, cornerRadius: Double, style: RoundedCornerStyle = .continuous) {
        self.rect = rect
        self.cornerRadii = RectangleCornerRadii(topLeading: cornerRadius, topTrailing: cornerRadius, bottomLeading: cornerRadius, bottomTrailing: cornerRadius)
        self.style = style
    }

    /// Creates a fixed rounded rectangle.
    /// 
    /// - Parameters:
    ///   - rect: The rectangle that defines the shape's frame.
    ///   - cornerSize: The size of the corners, specified in user space coordinates.
    ///   - style: The corner style. Defaults to the continuous style if not specified.
    package init(roundedRect rect: Rect3D, cornerSize: Size3D, style: RoundedCornerStyle = .continuous) {
        self.rect = rect
        self.cornerRadii = RectangleCornerRadii(topLeading: cornerSize.width, topTrailing: cornerSize.width, bottomLeading: cornerSize.height, bottomTrailing: cornerSize.height)
        self.style = style
    }
}