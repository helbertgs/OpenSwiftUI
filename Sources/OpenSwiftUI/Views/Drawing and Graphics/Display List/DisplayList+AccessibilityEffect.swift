//
// DisplayList+Feature.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

extension DisplayList {
    enum Feature : String, CaseIterable, Codable, Equatable, Hashable, Sendable {
        case animations
        case dynamicContent
        case flattened
        case interpolatorLayers
        case interpolatorRoots
        case platformViews
        case required
        case stateEffects
        case states
        case views
    }
}
