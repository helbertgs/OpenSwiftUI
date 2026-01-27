//
// DynamicRangeProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies the dynamic range of the image.
    class DynamicRangeProvider {

        /// The base provider.
        let base: AnyImageProviderBox

        /// The dynamic range of the image.
        let range: Image.DynamicRange?

        /// Initializes a new dynamic range provider.
        /// 
        /// - Parameters:
        ///   - base: The base provider.
        ///   - range: The dynamic range of the image.
        init(base: AnyImageProviderBox, range: Image.DynamicRange?) {
            self.base = base
            self.range = range
        }
    }
}