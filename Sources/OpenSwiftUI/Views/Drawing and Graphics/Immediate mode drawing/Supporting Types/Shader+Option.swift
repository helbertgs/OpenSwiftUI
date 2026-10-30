//
// Shader+Option.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 22, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Shader {
    
    enum Option: String, Codable, Equatable, Hashable, Sendable, SendableMetatype {
        case alphaOnlyLayer
        case colorFilter
        case distortionFilter
        case dithersColor
    }
}
