//
// RenderedImageProviderBox.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenSpatial

extension Image {

    /// A provider that specifies the rendered image.
    class RenderedImageProviderBox {

        /// The size of the image.
        let size: Size3D

        /// The label of the image.
        let label: Text?

        /// A Boolean value that specifies whether the image is opaque.
        let opaque: Bool

        /// The color mode of the image.
        let colorMode: ColorRenderingMode

        /// The renderer of the image.
        let renderer: (inout GraphicsContext) -> Void

        /// Initializes a new rendered image provider box.
        /// 
        /// - Parameters:
        ///   - size: The size of the image.
        ///   - label: The label of the image.
        ///   - opaque: A Boolean value that specifies whether the image is opaque.
        ///   - colorMode: The color mode of the image.
        ///   - renderer: The renderer of the image.
        init(size: Size3D, label: Text? = nil, opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, renderer: @escaping (inout GraphicsContext) -> Void) {
            self.size = size
            self.label = label
            self.opaque = opaque
            self.colorMode = colorMode
            self.renderer = renderer
        }
    }
}