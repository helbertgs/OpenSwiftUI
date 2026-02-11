//
// Font+SystemProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A font provider for system fonts.
    class SystemProvider : AnyFontProvider, @unchecked Sendable {

        // MARK: - Checking characteristics

        /// The size of the font.
        let size: Double

        /// The weight of the font.
        let weight: Weight?

        /// The design of the font.
        let design: Design?

        /// The text style of the font.
        let textStyle: TextStyle

        /// The maximum size of the font.
        let maximumSize: Double?

        // MARK: - Creating a SystemProvider

        /// Creates a new system font provider with the given size, weight, design, text style, and maximum size.
        ///
        /// - Parameter size: The size of the font.
        /// - Parameter weight: The weight of the font.
        /// - Parameter design: The design of the font.
        /// - Parameter textStyle: The text style of the font.
        /// - Parameter maximumSize: The maximum size of the font.
        init(size: Double, weight: Weight? = nil, design: Design? = nil, textStyle: TextStyle, maximumSize: Double? = nil) {
            self.size = size
            self.weight = weight
            self.design = design
            self.textStyle = textStyle
            self.maximumSize = maximumSize

            super.init()
        }

        // MARK: - Resolving a Font

        /// Resolves the font for the given context.
        /// 
        /// - Parameter context: The font context.
        /// - Returns: The resolved font.
        override func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.name = "System"
            resolved.pointSize = size
            resolved.weight = weight
            resolved.design = design
            resolved.textStyle = textStyle

            if let maximumSize {
                resolved.pointSize = min(resolved.pointSize, maximumSize)
            }

            return resolved
        }
    }
}
