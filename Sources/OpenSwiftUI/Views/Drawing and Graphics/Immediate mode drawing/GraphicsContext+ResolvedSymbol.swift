//
// GraphicsContext+ResolvedSymbol.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

extension GraphicsContext {

    /// A static sequence of drawing operations that may be drawn multiple times, preserving their resolution independence.
    /// 
    /// You resolve a child view in preparation for drawing it into a context by calling ``resolveSymbol(id:)``. 
    /// The resolved view takes into account environment values like the display resolution and current color scheme.
    public struct ResolvedSymbol {

        // MARK: - Getting the symbol properties

        /// The dimensions of the resolved symbol.
        public let size: Size3D

        
        init(size: Size3D) {
            self.size = size
        }
    }
}