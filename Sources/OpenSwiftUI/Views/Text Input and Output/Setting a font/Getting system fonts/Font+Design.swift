//
// Font+Design.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A design to use for fonts.
    public enum Design : String, Codable, Equatable, Hashable, Sendable {

        /// The default design.
        case `default`

        /// The serif design.
        case serif

        /// The rounded design.
        case rounded

        /// The monospaced design.
        case monospaced
    }
}