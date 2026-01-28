//
// Font+Leading.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A line spacing adjustment that you can apply to a font.
    ///
    /// Apply one of the `Leading` values to a font using the
    /// ``Font/leading(_:)`` method to increase or decrease the line spacing.
    public enum Leading : String, Codable, Equatable, Hashable, Sendable {

        /// The font's default line spacing.
        ///
        /// If you modify a font to use a nonstandard line spacing like
        /// ``tight`` or ``loose``, you can use this value to return to
        /// the font's default line spacing.
        case standard

        /// Reduced line spacing.
        ///
        /// This value typically reduces line spacing by 1 point for watchOS
        /// and 2 points on other platforms.
        case tight

        /// Increased line spacing.
        ///
        /// This value typically increases line spacing by 1 point for watchOS
        /// and 2 points on other platforms.
        case loose
    }
}