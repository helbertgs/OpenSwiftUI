//
// ResizingMode.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT


import Foundation

extension Image {

    /// The modes that OpenSwiftUI uses to resize an image to fit within its containing view.
    public enum ResizingMode : String, Codable, Equatable, Hashable, Sendable {

        // MARK: - Case(s).

        /// A mode to repeat the image at its original size, as many times as
        /// necessary to fill the available space.
        case tile

        /// A mode to enlarge or reduce the size of an image so that it fills the available space.
        case stretch
    }
}
