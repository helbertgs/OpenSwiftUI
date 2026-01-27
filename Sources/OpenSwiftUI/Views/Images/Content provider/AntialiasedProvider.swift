//
// AntialiasedProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies whether to apply antialiasing when rendering the image.
    class AntialiasedProvider {

        /// The base provider.
        let base: AnyImageProviderBox

        /// A Boolean value that specifies whether to apply antialiasing when rendering the image.
        let isAntialiased: Bool

        /// Initializes a new antialiased provider.
        /// 
        /// - Parameters:
        ///   - base: The base provider.
        ///   - isAntialiased: A Boolean value that specifies whether to apply antialiasing when rendering the image.
        init(base: AnyImageProviderBox, isAntialiased: Bool) {
            self.base = base
            self.isAntialiased = isAntialiased
        }
    }
}