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

        // MARK: - Checking Characteristics

        /// Returns `true` if the resolved font has a bold trait according to the font's weight is semi-bold or greater.
        public internal(set) var isBold: Bool = false

        /// Returns `true` if the resolved font is italic.
        public internal(set) var isItalic: Bool = false

        /// The point size of a resolved font.
        public internal(set) var pointSize: Double = 12

        /// The weight of a resolved font.
        public internal(set) var weight: Font.Weight = .regular

        /// The width of a resolved font.
        public internal(set) var width: Font.Width = .standard

        /// The leading of a resolved font.
        public internal(set) var leading: Font.Leading = .standard

        /// Returns `true` if a resolved font is monospaced, false otherwise.
        public internal(set) var isMonospaced: Bool = false

        /// Returns `true` if the resolved font's lowercased characters
        /// use small caps.
        public internal(set) var isLowercaseSmallCaps: Bool = false

        /// Returns `true` if the resolved font's uppercased characters
        /// use small caps.
        public internal(set) var isUppercaseSmallCaps: Bool = false

        /// Returns `true` if all of the resolved font's characters use small caps.
        public internal(set) var isSmallCaps: Bool = false
    }

    /// Evaluates this font to a resolved font given the current
    /// context.
    ///
    /// The system resolves a font's value at the time it uses the font in a
    /// given environment's context because ``Font`` is a late-binding token.
    ///
    /// - SeeAlso: ``EnvironmentValues/fontResolutionContext``
    public func resolve(in context: Font.Context) -> Font.Resolved {
        var context = context
        return context.resolve(self)
    }
}