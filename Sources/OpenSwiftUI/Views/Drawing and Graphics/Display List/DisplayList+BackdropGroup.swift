//
// DisplayList+BackdropGroup.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

extension DisplayList {
    struct BackdropGroup : Codable, Equatable, Hashable, Sendable {
        let isEnabled: Bool
        let name: String?
    }
}
