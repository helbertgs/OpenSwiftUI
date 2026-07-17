//
// AccessibilityVoiceOverEnabledKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 13, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@frozen public struct AccessibilityVoiceOverEnabledKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether the VoiceOver screen reader is in use.
    /// The state changes as the user turns on or off the VoiceOver screen reader.
    /// 
    /// The default value is `false`.
    public var accessibilityVoiceOverEnabled: Bool {
        get { self[AccessibilityVoiceOverEnabledKey.self] }
    }
}