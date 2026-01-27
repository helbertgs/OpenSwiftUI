//
// Orientation.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// The orientation of an image.
    ///
    /// Many image formats such as JPEG include orientation metadata in the
    /// image data. In other cases, you can specify image orientation
    /// in code. Properly specifying orientation is often important both for
    /// displaying the image and for certain kinds of image processing.
    ///
    /// In OpenSwiftUI, you provide an orientation value when initializing an ``Image``
    @frozen public enum Orientation : Int, CaseIterable, Codable, Equatable, Hashable, Sendable {

        // MARK: - Case(s).

        /// A value that indicates the original pixel data matches the image's
        /// intended display orientation.
        case up = 0

        /// A value that indicates a horizontal flip of the image from the
        /// orientation of its original pixel data.
        case upMirrored = 2

        /// A value that indicates a 180° rotation of the image from the
        /// orientation of its original pixel data.
        case down = 6

        /// A value that indicates a vertical flip of the image from the
        /// orientation of its original pixel data.
        case downMirrored = 4

        /// A value that indicates a 90° counterclockwise rotation from the
        /// orientation of its original pixel data.
        case left = 1

        /// A value that indicates a 90° clockwise rotation and horizontal
        /// flip of the image from the orientation of its original pixel
        /// data.
        case leftMirrored = 3

        /// A value that indicates a 90° clockwise rotation of the image from
        /// the orientation of its original pixel data.
        case right = 7

        /// A value that indicates a 90° counterclockwise rotation and
        /// horizontal flip from the orientation of its original pixel data.
        case rightMirrored = 5
    }
}
