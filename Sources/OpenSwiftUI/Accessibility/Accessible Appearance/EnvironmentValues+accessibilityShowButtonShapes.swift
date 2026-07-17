//
// EnvironmentValues+accessibilityShowButtonShapes.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 13, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

struct AccessibilityShowButtonShapesKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the system preference for Show Button Shapes is enabled.
    /// If this property’s value is true, interactive custom controls such as buttons should be drawn in such a way that their edges and borders are clearly visible.
    var accessibilityShowButtonShapes : Bool {
        get { self[AccessibilityShowButtonShapesKey.self] }
        set { self[AccessibilityShowButtonShapesKey.self] = newValue }
    }
}