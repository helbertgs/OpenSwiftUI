//
// CustomEventCategory.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 29, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

enum CustomEventCategory : Codable, Equatable, Hashable, Sendable {
    case observable
    case transaction
    case instantiation
    case dynamicProperties
    case graph
    case action
    case layout
    case unknown
    case animation
}
