//
// SymbolColorRenderingModeProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies the symbol color rendering mode of the image.
    class SymbolColorRenderingModeProvider {

        /// The base provider.
        let base: AnyImageProviderBox

        /// The symbol color rendering mode of the image.
        let mode: SymbolColorRenderingMode?

        /// Initializes a new symbol color rendering mode provider.
        /// 
        /// - Parameters:
        ///   - base: The base provider.
        ///   - mode: The symbol color rendering mode of the image.
        init(base: AnyImageProviderBox, mode: SymbolColorRenderingMode?) {
            self.base = base
            self.mode = mode
        }
    }
}