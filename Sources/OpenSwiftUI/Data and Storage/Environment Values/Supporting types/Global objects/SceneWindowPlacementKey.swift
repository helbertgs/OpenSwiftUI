//
// SceneWindowPlacementKey.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

typealias MakeWindowPlacement = (WindowLayoutRoot, WindowPlacementContext) -> WindowPlacement

struct SceneWindowPlacementKey : EnvironmentKey {
    static var defaultValue: MakeWindowPlacement? {
        nil
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func _valuesEqual(_ lhs: MakeWindowPlacement?, _ rhs: MakeWindowPlacement?) -> Bool {
        false
    }
}

extension EnvironmentValues {
    var defaultSceneWindowPlacement : MakeWindowPlacement? {
        get { self[SceneWindowPlacementKey.self] }
        set { self[SceneWindowPlacementKey.self] = newValue }
    }
}