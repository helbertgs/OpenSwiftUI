//
// Location.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Image {

    /// A location for the image.
    enum Location {
        /// The bundle containing the image.
        case bundle(Bundle)
        
        /// The system containing the image.
        case system
    }
}