//
// EnvironmentValues+accessibilityAssistiveAccessEnabled.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 19, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

struct AccessibilityAssistiveAccessEnabledKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether Assistive Access is in use.
    var accessibilityAssistiveAccessEnabled : Bool {
        get { self[AccessibilityAssistiveAccessEnabledKey.self] }
        set { self[AccessibilityAssistiveAccessEnabledKey.self] = newValue }
    }
}