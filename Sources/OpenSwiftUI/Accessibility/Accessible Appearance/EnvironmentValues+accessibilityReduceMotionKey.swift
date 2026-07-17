//
// EnvironmentValues+accessibilityReduceMotionKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 13, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

struct AccessibilityReduceMotionKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the setting for playing animations in an animated image is on. When this value is false, any presented image that contains animation should not play automatically.
    /// The default value is `false`.
    public var accessibilityReduceMotion: Bool {
        get { self[AccessibilityReduceMotionKey.self] }
        set { self[AccessibilityReduceMotionKey.self] = newValue }
    }
}
