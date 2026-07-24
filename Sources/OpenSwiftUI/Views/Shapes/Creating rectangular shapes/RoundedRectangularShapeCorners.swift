//
// RoundedRectangularShapeCorners.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A type describing the corner styles of a ``RoundedRectangularShape``.
public struct RoundedRectangularShapeCorners : Sendable, Hashable {

    /// The top leading corner style.
    public var topLeading: Double

    /// The bottom leading corner style.
    public var bottomLeading: Double

    /// The top trailing corner style.
    public var topTrailing: Double

    /// The bottom trailing corner style
    public var bottomTrailing: Double

    /// Create corner styles with per-corner styles.
    /// - Parameters:
    ///   - topLeading: Top leading corner style.
    ///   - bottomLeading: Bottom leading corner style.
    ///   - topTrailing: Top trailing corner style.
    ///   - bottomTrailing: Bottom trailing corner style.
    public init(topLeading: Double = 0, topTrailing: Double = 0, bottomLeading: Double = 0, bottomTrailing: Double = 0) {
        self.topLeading = topLeading
        self.topTrailing = topTrailing
        self.bottomLeading = bottomLeading
        self.bottomTrailing = bottomTrailing
    }

    /// Create corner styles with all corner having the same style.
    /// - Parameter all: corner style for all corners.
    public init(all value: Double) {
        self.topLeading = value
        self.topTrailing = value
        self.bottomLeading = value
        self.bottomTrailing = value
    }

    /// Corner styles with fixed radius in all four corners.
    public static func fixed(_ radius: Double) -> RoundedRectangularShapeCorners {
        .init(all: radius)
    }
}
