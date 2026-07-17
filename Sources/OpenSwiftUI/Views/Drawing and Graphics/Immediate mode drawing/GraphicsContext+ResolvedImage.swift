//
// GraphicsContext+ResolvedImage.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial
import OpenSTB

extension GraphicsContext {

    /// An image resolved to a particular environment.
    /// 
    /// You resolve an ``Image`` in preparation for drawing it into a context, either manually by calling ``resolve(_:)``, or automatically when calling ``draw(_:in:style:)`` or ``draw(_:at:anchor:)``. 
    /// The resolved image takes into account environment values like the display resolution and current color scheme.
    public struct ResolvedImage {

        // MARK: - Getting the image properties
        
        /// The size of the image.
        public var size: Size3D
        
        /// The distance from the top of the image to its baseline.
        public let baseline: Double
        
        /// An optional shading to fill the image with.
        public var shading: GraphicsContext.Shading?

        /// Creates a new resolved image with the given size, baseline, and shading.
        /// 
        /// - Parameter size: The size of the image.
        /// - Parameter baseline: The distance from the top of the image to its baseline.
        /// - Parameter shading: An optional shading to fill the image with.
        init(size: Size3D, baseline: Double, shading: GraphicsContext.Shading?) {
            self.size = size
            self.baseline = baseline
            self.shading = shading
        }

        init(image: Image) {
            self.size = .zero
            self.baseline = 0
            
            if let imageProvider = image.provider as? Image.ImageProviderBox<Image.DataImageProviderBox> {
                var width: Int32 = 0
                var height: Int32 = 0
                var channels: Int32 = 0

                imageProvider.provider.data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) in
                    let data = bytes.bindMemory(to: UInt8.self)
                    if let img = stbi_load_from_memory(data.baseAddress, Int32(data.count), &width, &height, &channels, 0) {
                        self.size = .init(width: Double(width), height: Double(height))
                        stbi_image_free(img)
                    }
                }
            }
        }
    }
}