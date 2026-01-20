//
// SceneIdealSizeKey.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

struct ScenePersistentSystemOverlaysKey : EnvironmentKey {
    static var defaultValue: Visibility {
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
    static func _valuesEqual(_ lhs: Visibility, _ rhs: Visibility) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}

extension EnvironmentValues {
    var defaultPersistentSystemOverlays: Visibility {
        get { self[ScenePersistentSystemOverlaysKey.self] }
        set { self[ScenePersistentSystemOverlaysKey.self] = newValue }
    }
}
