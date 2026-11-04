//
// ViewRenderingPhase.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

enum ViewRenderingPhase: String, Codable, Equatable, Hashable, Sendable {
    case renderingAsync
    case none
    case rendering
}
