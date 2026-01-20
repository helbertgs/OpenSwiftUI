//
// SceneWindowLevelKey.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

public struct SceneWindowLevelKey : EnvironmentKey {
    public static var defaultValue: WindowLevel {
        .automatic
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func _valuesEqual(_ lhs: WindowLevel, _ rhs: WindowLevel) -> Bool {
        lhs == rhs
    }
}

extension EnvironmentValues {
    var defaulScenetWindowLevel: WindowLevel {
        get { self[SceneWindowLevelKey.self] }
        set { self[SceneWindowLevelKey.self] = newValue }
    }
}
