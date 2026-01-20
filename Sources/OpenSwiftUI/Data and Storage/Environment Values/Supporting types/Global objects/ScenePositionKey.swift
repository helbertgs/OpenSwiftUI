//
// ScenePositionKey.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

public struct ScenePositionKey : EnvironmentKey {
    public static var defaultValue: UnitPoint {
        .zero
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func _valuesEqual(_ lhs: UnitPoint, _ rhs: UnitPoint) -> Bool {
        lhs == rhs
    }
}

extension EnvironmentValues {
    var defaultScenePosition: UnitPoint {
        get { self[ScenePositionKey.self] }
        set { self[ScenePositionKey.self] = newValue }
    }
}
