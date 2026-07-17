//
// EnvironmentValues+accessibilityDimFlashingLightsKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 13, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

struct AccessibilityDimFlashingLightsKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether the user has enabled an assistive technology.
    ///
    /// The default value is `false`.
    public var AccessibilityDimFlashingLightsKey: Bool {
        get { self[AccessibilityEnabledKey.self] }
        set { self[AccessibilityEnabledKey.self] = newValue }
    }
}
