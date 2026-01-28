//
// Font+Width.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A width to use for fonts that have multiple widths.
    public struct Width : Hashable, Sendable {

        // MARK: - Getting standard font widths

        /// The compressed width.
        public static let compressed = Font.Width(-0.3)

        /// The condensed width.
        public static let condensed = Font.Width(-0.2)

        /// The standard width.
        public static let standard = Font.Width(0.0)

        /// The expanded width.
        public static let expanded = Font.Width(0.2)

        // MARK: - Accessing the width’s value

        /// The value of the width.
        public let value: Double

        // MARK: - Creating an explicit font width

        /// Creates a new font width with the given value.
        /// 
        /// - Parameter value: The value of the width.
        public init(_ value: Double) {
            self.value = value
        }
    }
}