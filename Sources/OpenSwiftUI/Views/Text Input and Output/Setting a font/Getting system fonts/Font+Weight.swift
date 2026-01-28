//
// Font+Weight.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A weight to use for fonts.
    @frozen public struct Weight : Codable, Equatable, Hashable, Sendable {

        // MARK: - Getting font weights

        /// The ultra light weight.
        public static let ultraLight = Font.Weight(value: -0.8)

        /// The thin weight.
        public static let thin = Font.Weight(value: -0.6)

        /// The light weight.
        public static let light = Font.Weight(value: -0.4)

        /// The regular weight.
        public static let regular = Font.Weight(value: 0)

        /// The medium weight.
        public static let medium = Font.Weight(value: 0.23)

        /// The semibold weight.
        public static let semibold = Font.Weight(value: 0.3)

        /// The bold weight.
        public static let bold = Font.Weight(value: 0.4)

        /// The heavy weight.
        public static let heavy = Font.Weight(value: 0.56)

        /// The black weight.
        public static let black = Font.Weight(value: 0.62)

        // MARK: - Creating a font weight

        /// The value of the weight.
        package let value: Double

        /// Creates a new weight with the given value.
        /// 
        /// - Parameter value: The value of the weight.
        private init(value: Double) {
            self.value = value
        }
    }
}