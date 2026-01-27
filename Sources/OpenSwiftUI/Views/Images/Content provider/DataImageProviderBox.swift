//
// DataImageProviderBox.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies the data of the image.
    class DataImageProviderBox {

        /// The data of the image.
        let data: Data

        /// Initializes a new data image provider.
        /// 
        /// - Parameters:
        ///   - data: The data of the image.
        init(data: Data) {
            self.data = data
        }
    }
}