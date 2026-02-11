//
// Font+StaticModifierProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A font provider for static modifiers.
    class StaticModifierProvider<Modifier> : AnyFontProvider, @unchecked Sendable where Modifier : FontModifier {

        // MARK: - Checking characteristics

        /// The base provider.
        let base: Any

        /// The modifier.
        let modifier: Modifier

        // MARK: - Creating a StaticModifierProvider

        /// Creates a new static modifier font provider with the given base and modifier.
        ///
        /// - Parameter base: The base provider.
        /// - Parameter modifier: The modifier.
        init(base: Any, modifier: Modifier) {
            self.base = base
            self.modifier = modifier

            super.init()
        }

        // MARK: - Resolving a Font

        /// Resolves the font for the given context.
        /// 
        /// - Parameter context: The font context.
        /// - Returns: The resolved font.
        override func resolve(_ context: Font.Context) -> Font.Resolved {
            guard let base = self.base as? AnyFontProvider else {
                return .init()
            }

            let resolved = base.resolve(context)
            var context = context
            context.resolved = resolved

            return modifier.resolve(context)
        }
    }
}
