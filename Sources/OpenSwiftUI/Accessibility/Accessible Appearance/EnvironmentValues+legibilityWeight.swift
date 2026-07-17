//
// EnvironmentValues+legibilityWeight.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 19, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

struct LegibilityWeightKey : EnvironmentKey {
    static var defaultValue: LegibilityWeight? {
        nil
    }
}

extension EnvironmentValues {
    /// The font weight to apply to text.
    /// This value reflects the value of the Bold Text display setting found in the Accessibility settings.
    var legibilityWeight : LegibilityWeight? {
        get { self[LegibilityWeightKey.self] }
        set { self[LegibilityWeightKey.self] = newValue }
    }
}