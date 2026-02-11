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

        /// The name of a resolved font.
        var name: String

        /// The family of a resolved font.
        var family: String?

        /// Returns `true` if the resolved font has a bold trait according to the font's weight is semi-bold or greater.
        public internal(set)var isBold: Bool

        /// Returns `true` if the resolved font is italic.
        public internal(set)var isItalic: Bool

        /// The point size of a resolved font.
        public internal(set)var pointSize: Double

        /// The style of a resolved font.
        public internal(set)var textStyle: Font.TextStyle?

        /// The weight of a resolved font.
        public internal(set)var weight: Font.Weight?

        /// The width of a resolved font.
        public internal(set)var width: Font.Width

        /// The leading of a resolved font.
        public internal(set)var leading: Font.Leading

        /// The design of a resolved font.
        public internal(set)var design: Font.Design?

        /// Returns `true` if a resolved font is monospaced, false otherwise.
        public internal(set)var isMonospaced: Bool

        /// Returns `true` if the resolved font's lowercased characters
        /// use small caps.
        public internal(set)var isLowercaseSmallCaps: Bool

        /// Returns `true` if the resolved font's uppercased characters
        /// use small caps.
        public internal(set)var isUppercaseSmallCaps: Bool

        /// Returns `true` if all of the resolved font's characters use small caps.
        public internal(set)var isSmallCaps: Bool

        // MARK: - Creating a Resolved Font

        public init(
            name: String = "",
            family: String? = nil,
            isBold: Bool = false,
            isItalic: Bool = false, 
            pointSize: Double = 12.0,
            textStyle: Font.TextStyle? = nil,
            weight: Font.Weight? = nil,
            width: Font.Width = .standard,
            leading: Font.Leading = .standard,
            design: Font.Design? = nil,
            isMonospaced: Bool = false,
            isLowercaseSmallCaps: Bool = false, 
            isUppercaseSmallCaps: Bool = false, 
            isSmallCaps: Bool = false
        ) {
            self.name = name
            self.family = family
            self.isBold = isBold
            self.isItalic = isItalic
            self.pointSize = pointSize
            self.textStyle = textStyle
            self.weight = weight
            self.width = width
            self.leading = leading
            self.design = design
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
        provider.resolve(context)
    }
}
