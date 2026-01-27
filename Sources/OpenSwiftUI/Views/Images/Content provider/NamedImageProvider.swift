//
// NamedImageProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A provider that specifies the name of the image.
    class NamedImageProvider: @unchecked Sendable {

        /// The name of the image.
        let name: String

        /// 
        /// The value of the image.
        let value: Double?

        /// The label of the image.
        let label: Text?

        /// The location of the image.
        let location: Location

        /// A Boolean value that specifies whether the image is decorative.
        let decorative: Bool

        /// Initializes a new named image provider.
        /// 
        /// - Parameters:
        ///   - name: The name of the image.
        ///   - value: The value of the image.
        ///   - label: The label of the image.
        ///   - location: The location of the image.
        ///   - decorative: A Boolean value that specifies whether the image is decorative.
        init(name: String, value: Double? = nil, label: Text? = nil, location: Location, decorative: Bool = false) {
            self.name = name
            self.value = value
            self.label = label
            self.location = location
            self.decorative = decorative
        }
    }
}