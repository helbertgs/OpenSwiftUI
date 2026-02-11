//
// Font+NamedProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A font provider for named fonts.
    class NamedProvider : AnyFontProvider, @unchecked Sendable {

        // MARK: - Checking characteristics

        /// The name of the font.
        let name: String

        /// The size of the font.
        let size: Double

        /// The text style of the font.
        let textStyle: TextStyle?

        // MARK: - Creating a NamedProvider

        /// Creates a new named font provider with the given name, size, and text style.
        ///
        /// - Parameter name: The name of the font.
        /// - Parameter size: The size of the font.
        /// - Parameter textStyle: The text style of the font.
        init(name: String, size: Double, textStyle: TextStyle? = nil) {
            self.name = name
            self.size = size
            self.textStyle = textStyle

            super.init()
        }

        // MARK: - Resolving a Font

        /// Resolves the font for the given context.
        /// 
        /// - Parameter context: The font context.
        /// - Returns: The resolved font.
        override func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.name = name
            resolved.pointSize = size
            resolved.textStyle = textStyle

            return resolved
        }
    }
}
