//
// GraphicsContext+ResolvedText.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

extension GraphicsContext {

    /// A text view resolved to a particular environment.
    /// 
    /// You resolve a Text view in preparation for drawing it into a context, either manually by calling ``resolve(_:)`` or automatically when calling ``draw(_:in:)`` or ``draw(_:at:anchor:)``. 
    /// The resolved text view takes into account environment values like the display resolution and current color scheme.
    public struct ResolvedText {

        // MARK: - Getting the text properties

        /// Gets the distance from the first line’s ascender to its baseline.
        /// 
        /// - Parameter size: 
        /// - Returns: 
        public func firstBaseline(in size: Size3D) -> Double {
            0
        }

        /// Gets the distance from the first line’s ascender to the last line’s baseline.
        /// 
        /// - Parameter size: 
        /// - Returns: 
        public func lastBaseline(in size: Size3D) -> Double {
            0
        }

        /// Measures the size of the resolved text for a given area into which the text should be placed.
        /// 
        /// - Parameter size: 
        /// - Returns: 
        public func measure(in size: Size3D) -> Size3D {
            size
        }

        /// The shading to fill uncolored text regions with.
        /// 
        /// This value defaults to the foreground shading.
        public var shading: GraphicsContext.Shading

        /// 
        /// 
        /// - Parameter shading: 
        init(shading: GraphicsContext.Shading) {
            self.shading = shading
        }
    }
}