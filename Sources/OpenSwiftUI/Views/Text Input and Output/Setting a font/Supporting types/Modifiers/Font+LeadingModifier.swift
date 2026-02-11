//
// Font+LeadingModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// The leading modifier.
    struct LeadingModifier : FontModifier {

        // MARK: - Checking Characteristics

        /// The leading of the font.
        let leading: Leading

        // MARK: - Creating a Leading modifier

        /// Creates a new leading modifier with the given leading.
        ///
        /// - Parameter leading: The leading of the font.
        init(_ leading: Leading) {
            self.leading = leading
        }

        // MARK: - Resolving a Font

        /// Resolves a font with the leading modifier applied.
        /// 
        /// - Parameter context: The font context to resolve the font with.
        /// - Returns: A resolved font with the leading modifier applied.
        func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.leading = leading

            return resolved
        }
    }
}
