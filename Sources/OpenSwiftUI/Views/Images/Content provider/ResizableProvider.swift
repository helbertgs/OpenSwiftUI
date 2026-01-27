//
// ResizableProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies the resizable image.
    class ResizableProvider {

        /// The base provider.
        let base: AnyImageProviderBox

        /// The cap insets of the image.
        let capInsets: EdgeInsets

        /// The resizing mode of the image.
        let resizingMode: Image.ResizingMode

        /// Initializes a new resizable provider.
        /// 
        /// - Parameters:
        ///   - base: The base provider.
        ///   - capInsets: The cap insets of the image.
        ///   - resizingMode: The resizing mode of the image.
        init(base: AnyImageProviderBox, capInsets: EdgeInsets, resizingMode: Image.ResizingMode) {
            self.base = base
            self.capInsets = capInsets
            self.resizingMode = resizingMode
        }
    }
}