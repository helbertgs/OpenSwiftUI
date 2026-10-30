//
// CoordinateSpace+ID.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 28, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

extension CoordinateSpace {
    enum ID : String, Codable, Equatable, Hashable, Sendable {
        case hostingView
        case immersiveSpace
        case viewGraphHost
        case viewGraphHostContainerCoordinateSpace
        case worldReference
    }
}