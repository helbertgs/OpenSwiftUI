//
// Font+MonospaceDigitModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// The monospace digit modifier.
    struct MonospaceDigitModifier : FontModifier {

        // MARK: - Checking Characteristics

        /// Whether the monospace digit modifier is active.
        let isActive: Bool

        // MARK: - Creating a Monospaced modifier

        /// Creates a new monospace digit modifier with the given active state.
        ///
        /// - Parameter isActive: Whether the monospace digit modifier is active.
        init(_ isActive: Bool) {
            self.isActive = isActive
        }

        // MARK: - Resolving a Font

        /// Resolves a font with the monospace digit modifier applied.
        /// 
        /// - Parameter context: The font context to resolve the font with.
        /// - Returns: A resolved font with the monospace digit modifier applied.
        func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.isMonospaced = isActive

            return resolved
        }
    }
}
