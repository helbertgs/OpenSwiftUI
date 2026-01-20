//
// SceneLaunchBehaviorKey.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

struct SceneLaunchBehaviorKey : EnvironmentKey {
    static var defaultValue: SceneLaunchBehavior {
        .automatic
    }

    static func _valuesEqual(_ lhs: SceneLaunchBehavior, _ rhs: SceneLaunchBehavior) -> Bool {
        lhs.role == rhs.role
    }
}

extension EnvironmentValues {
    var sceneLaunchBehavior: SceneLaunchBehavior {
        get { self[SceneLaunchBehaviorKey.self] }
        set { self[SceneLaunchBehaviorKey.self] = newValue }
    }
}