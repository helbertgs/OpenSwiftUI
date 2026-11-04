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
    enum AccessibilityEffect: @unchecked Sendable {
        case attachments([String])
        case representation(DisplayList)
    }
}
