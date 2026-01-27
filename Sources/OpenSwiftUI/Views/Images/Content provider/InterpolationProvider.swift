//
// InterpolationProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies the interpolation of the image.
    class InterpolationProvider {

        /// The base provider.
        let base: AnyImageProviderBox

        /// The interpolation of the image.
        let interpolation: Image.Interpolation

        /// Initializes a new interpolation provider.
        /// 
        /// - Parameters:
        ///   - base: The base provider.
        ///   - interpolation: The interpolation of the image.
        init(base: AnyImageProviderBox, interpolation: Image.Interpolation) {
            self.base = base
            self.interpolation = interpolation
        }
    }
}