//
// _GraphInputs+Phase.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

extension _GraphInputs {
    enum Phase : String, Codable, CaseIterable, Equatable, Hashable, Sendable {
        case invalid
        case inserted
        case removed
        case resetSeed
        case unknown
    }
}