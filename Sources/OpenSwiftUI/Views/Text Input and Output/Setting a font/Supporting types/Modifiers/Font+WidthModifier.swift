//
// Font+WidthModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// The width modifier.
    struct WidthModifier : FontModifier {

        // MARK: - Checking Characteristics

        /// The width of the font.
        let width: Font.Width

        // MARK: - Creating a Width modifier

        /// Creates a new width modifier with the given width.
        ///
        /// - Parameter width: The width of the font.
        init(_ width: Font.Width) {
            self.width = width
        }

        // MARK: - Resolving a Font

        /// Resolves a font with the width modifier applied.
        /// 
        /// - Parameter context: The font context to resolve the font with.
        /// - Returns: A resolved font with the width modifier applied.
        func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.width = width

            return resolved
        }
    }
}
