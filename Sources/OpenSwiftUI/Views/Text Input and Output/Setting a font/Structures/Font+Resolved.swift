//
// Font+Resolved.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A concrete font value.
    ///
    /// `Font.Resolved` is a concrete representation of a Font that can be shown,
    /// with a specific set of `EnvironmentValues`.
    /// A `Resolved` font will always map to the same FT_Face on a given platform.
    ///
    /// - SeeAlso: `Font`.
    public struct Resolved : Hashable, Sendable {

        // Returns the opaque pointer that represents a font object.
        // @Sendable public let pointer: OpaquePointer?

        // MARK: - Checking Characteristics

        /// Returns `true` if the resolved font has a bold trait according to the font's weight is semi-bold or greater.
        public let isBold: Bool

        /// Returns `true` if the resolved font is italic.
        public let isItalic: Bool

        /// The point size of a resolved font.
        public let pointSize: Double

        /// The weight of a resolved font.
        public let weight: Font.Weight

        /// The width of a resolved font.
        public let width: Font.Width

        /// The leading of a resolved font.
        public let leading: Font.Leading

        /// Returns `true` if a resolved font is monospaced, false otherwise.
        public let isMonospaced: Bool

        /// Returns `true` if the resolved font's lowercased characters
        /// use small caps.
        public let isLowercaseSmallCaps: Bool

        /// Returns `true` if the resolved font's uppercased characters
        /// use small caps.
        public let isUppercaseSmallCaps: Bool

        /// Returns `true` if all of the resolved font's characters use small caps.
        public let isSmallCaps: Bool

        // MARK: - Creating a Resolved Font

        public init(isBold: Bool, isItalic: Bool, pointSize: Double, weight: Font.Weight, width: Font.Width, leading: Font.Leading, isMonospaced: Bool, isLowercaseSmallCaps: Bool, isUppercaseSmallCaps: Bool, isSmallCaps: Bool, ) {
            self.isBold = isBold
            self.isItalic = isItalic
            self.pointSize = pointSize
            self.weight = weight
            self.width = width
            self.leading = leading
            self.isMonospaced = isMonospaced
            self.isLowercaseSmallCaps = isLowercaseSmallCaps
            self.isUppercaseSmallCaps = isUppercaseSmallCaps
            self.isSmallCaps = isSmallCaps
        }
    }

    /// Evaluates this font to a resolved font given the current
    /// context.
    ///
    /// The system resolves a font's value at the time it uses the font in a
    /// given environment's context because ``Font`` is a late-binding token.
    ///
    /// - SeeAlso: ``EnvironmentValues/fontResolutionContext``
    public func resolve(in context: Font.Context) -> Font.Resolved {
        fatalError("Not implemented yet")
    }
}