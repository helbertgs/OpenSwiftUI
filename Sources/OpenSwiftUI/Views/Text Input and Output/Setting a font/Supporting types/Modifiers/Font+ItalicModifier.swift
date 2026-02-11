//
// Font+ItalicModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// The italic modifier.
    struct ItalicModifier : FontModifier {

        // MARK: - Checking Characteristics

        /// Whether the italic modifier is active.
        let isActive: Bool

        // MARK: - Creating an Italic modifier

        /// Creates a new italic modifier with the given active state.
        ///
        /// - Parameter isActive: Whether the italic modifier is active.
        init(_ isActive: Bool) {
            self.isActive = isActive
        }
        
        // MARK: - Resolving a Font

        /// Resolves a font with the italic modifier applied.
        /// 
        /// - Parameter context: The font context to resolve the font with.
        /// - Returns: A resolved font with the italic modifier applied.
        func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.isItalic = isActive

            return resolved
        }
    }
}
