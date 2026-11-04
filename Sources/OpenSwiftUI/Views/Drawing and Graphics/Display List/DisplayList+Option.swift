//
// DisplayList+Option.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

extension DisplayList {
    enum Option : Codable, Equatable, Hashable, Sendable {
        case defaultValue
        case disableCanonicalization
    }
}
