//
// Font+MonospacedModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// The monospaced modifier.
    struct MonospacedModifier : FontModifier {

        // MARK: - Checking Characteristics

        /// Whether the monospaced modifier is active.
        let isActive: Bool

        // MARK: - Creating a Monospaced modifier

        /// Creates a new monospaced modifier with the given active state.
        ///
        /// - Parameter isActive: Whether the monospaced modifier is active.
        init(_ isActive: Bool = true) {
            self.isActive = isActive
        }

        // MARK: - Resolving a Font

        /// Resolves a font with the monospaced modifier applied.
        /// 
        /// - Parameter context: The font context to resolve the font with.
        /// - Returns: A resolved font with the monospaced modifier applied.
        func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.isMonospaced = isActive

            return resolved
        }
    }
}
