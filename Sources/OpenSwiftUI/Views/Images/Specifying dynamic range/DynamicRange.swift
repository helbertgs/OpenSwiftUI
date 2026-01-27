//
// DynamicRange.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT


import Foundation

extension Image {

    /// A dynamic range for an image.
    ///
    /// A dynamic range is a range of values that an image can represent.
    /// The dynamic range is used to determine the range of values that an
    /// image can represent.
    ///
    public struct DynamicRange : Codable, Equatable, Hashable, Sendable {

        // MARK: - Checking Characteristics.

        /// The storage for the dynamic range.
        let storage: Storage

        // MARK: - Creating a Dynamic Range.

        /// Creates a dynamic range with the given storage.
        /// 
        /// - Parameter storage: The storage for the dynamic range.
        init(storage: Storage) {    
            self.storage = storage
        }

        /// Restrict the image content dynamic range to the standard range.
        public static let standard = DynamicRange(storage: .standard)

        /// Allow image content to use some extended range. This is
        /// appropriate for placing HDR content next to SDR content.
        public static let constrainedHigh = DynamicRange(storage: .constrainedHigh)

        /// Allow image content to use an unrestricted extended range.
        public static let high = DynamicRange(storage: .high)

        /// The storage for the dynamic range.
        enum Storage : String, Codable, Equatable, Hashable, Sendable {

            /// The standard dynamic range.
            case standard

            /// The constrained high dynamic range.
            case constrainedHigh

            /// The high dynamic range.
            case high
        }
    }
}