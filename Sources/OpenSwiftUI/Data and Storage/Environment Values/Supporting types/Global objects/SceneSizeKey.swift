//
// SceneSizeKey.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

public struct SceneSizeKey : EnvironmentKey {
    public static var defaultValue: Size3D {
        .init(width: 900, height: 450)
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func _valuesEqual(_ lhs: Size3D, _ rhs: Size3D) -> Bool {
        lhs == rhs
    }
}

extension EnvironmentValues {
    var defaultSceneSize: Size3D {
        get { self[SceneSizeKey.self] }
        set { self[SceneSizeKey.self] = newValue }
    }
}
