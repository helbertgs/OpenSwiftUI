//
// DisplayList+ViewUpdater.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 29, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

extension DisplayList {
    struct ViewUpdater {
    }
}

extension DisplayList.ViewUpdater {
    enum Platform : String, Codable, CustomStringConvertible, Equatable, Hashable, Sendable {
        case windows
        case macOS
        case linux

        var description: String {
            rawValue.capitalized
        }
    }
}
