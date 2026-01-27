//
// RenderingModeProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies the rendering mode of the image.
    class RenderingModeProvider {

        /// The base provider.
        let base: AnyImageProviderBox

        /// The rendering mode of the image.
        let mode: Image.TemplateRenderingMode?

        /// Initializes a new rendering mode provider.
        /// 
        /// - Parameters:
        ///   - base: The base provider.
        ///   - mode: The rendering mode of the image.
        init(base: AnyImageProviderBox, mode: Image.TemplateRenderingMode?) {
            self.base = base
            self.mode = mode
        }
    }
}