//
// FillStyle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A style for rasterizing vector shapes.
@frozen
public struct FillStyle : BitwiseCopyable, Copyable, Equatable, Sendable {

    // MARK: - Setting fill style properties

    /// A Boolean value that indicates whether to use the even-odd rule when rendering a shape.
    public var isEOFilled: Bool

    /// A Boolean value that indicates whether to apply antialiasing to the edges of a shape.
    public var isAntialiased: Bool

    // MARK: - Creating a fill style

    /// Creates a new fill style with the specified settings.
    /// 
    /// - Parameters:
    ///   - eoFill: A Boolean value that indicates whether to use the even-odd rule for rendering a shape. Pass false to use the non-zero winding number rule instead.
    ///   - antialiased: A Boolean value that indicates whether to use antialiasing when rendering the edges of a shape.
    public init(eoFill: Bool = false, antialiased: Bool = true) {
        self.isEOFilled = eoFill
        self.isAntialiased = antialiased
    }
}
