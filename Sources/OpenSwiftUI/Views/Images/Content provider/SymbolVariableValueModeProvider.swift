//
// SymbolVariableValueModeProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies the symbol variable value mode of the image.
    class SymbolVariableValueModeProvider {

        /// The base provider.
        let base: AnyImageProviderBox

        /// The symbol variable value mode of the image.
        let mode: SymbolVariableValueMode?

        /// Initializes a new symbol variable value mode provider.
        /// 
        /// - Parameters:
        ///   - base: The base provider.
        ///   - mode: The symbol variable value mode of the image.
        init(base: AnyImageProviderBox, mode: SymbolVariableValueMode?) {
            self.base = base
            self.mode = mode
        }
    }
}