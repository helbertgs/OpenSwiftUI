//
// Font+FontBox.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A box for a font provider.
    class FontBox<Provider: AnyFontProvider> : AnyFontProvider, @unchecked Sendable {

        // MARK: - Checking characteristics

        /// The base provider.
        let base: Provider

        // MARK: - Creating a NamedProvider

        /// Creates a new font box with the given provider.
        ///
        /// - Parameter base: The base provider.
        init(base: Provider) {
            self.base = base
            super.init()
        }

        // MARK: - Resolving a Font

        /// Resolves the font for the given context.
        /// 
        /// - Parameter context: The font context.
        /// - Returns: The resolved font.
        override func resolve(_ context: Font.Context) -> Font.Resolved {
            base.resolve(context)
        }
    }
}
