//
// SymbolRenderingModeProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies the symbol rendering mode of the image.
    class SymbolRenderingModeProvider {

        /// The base provider.
        let base: AnyImageProviderBox

        /// The symbol rendering mode of the image.
        let mode: SymbolRenderingMode?

        /// Initializes a new symbol rendering mode provider.
        /// 
        /// - Parameters:
        ///   - base: The base provider.
        ///   - mode: The symbol rendering mode of the image.
        init(base: AnyImageProviderBox, mode: SymbolRenderingMode?) {
            self.base = base
            self.mode = mode
        }
    }
}