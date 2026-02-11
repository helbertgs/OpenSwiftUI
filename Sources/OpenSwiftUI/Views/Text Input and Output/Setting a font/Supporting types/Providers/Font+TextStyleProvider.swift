//
// Font+TextStyleProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A font provider for text styles.
    class TextStyleProvider : AnyFontProvider, @unchecked Sendable {

        // MARK: - Checking characteristics

        /// The text style of the font.
        let style: TextStyle

        /// The design of the font.
        let design: Design?

        /// The weight of the font.
        let weight: Weight?

        // MARK: - Creating a TextStyleProvider

        /// Creates a new text style font provider with the given style, design, and weight.
        ///
        /// - Parameter style: The text style of the font.
        /// - Parameter design: The design of the font.
        /// - Parameter weight: The weight of the font.
        init(style: TextStyle, design: Design? = nil, weight: Weight? = nil) {
            self.style = style
            self.design = design
            self.weight = weight

            super.init()
        }

        // MARK: - Resolving a Font

        /// Resolves the font for the given context.
        /// 
        /// - Parameter context: The font context.
        /// - Returns: The resolved font.
        override func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.weight = weight
            resolved.design = design
            resolved.textStyle = style

            return resolved
        }
    }
}
