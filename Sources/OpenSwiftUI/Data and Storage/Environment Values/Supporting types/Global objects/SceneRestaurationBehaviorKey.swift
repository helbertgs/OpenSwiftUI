//
// SceneRestorationBehaviorKey.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

struct SceneRestorationBehaviorKey : EnvironmentKey {
    static var defaultValue: SceneRestorationBehavior {
        .automatic
    }

    static func _valuesEqual(_ lhs: SceneRestorationBehavior, _ rhs: SceneRestorationBehavior) -> Bool {
        lhs.role == rhs.role
    }
}

extension EnvironmentValues {
    var sceneRestorationBehavior: SceneRestorationBehavior {
        get { self[SceneRestorationBehaviorKey.self] }
        set { self[SceneRestorationBehaviorKey.self] = newValue }
    }
}