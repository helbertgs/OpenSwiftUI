//
// SceneRestorationBehavior.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// The restoration behavior for a scene.
///
/// Use the ``Scene/restorationBehavior(_:)`` scene modifier to apply a
/// value of this type to a ``Scene`` you define in your ``App`` declaration.
/// The value you specify determines how the system will restore windows from a
/// previous run of your application.
///
/// For example, you may have a scene that you do not wish to be restored on
/// launch:
///
///     @main
///     struct MyApp: App {
///         var body: some Scene {
///             WindowGroup {
///                 ContentView()
///             }
///             Window(id: "network-test", "Network Connection Test") {
///                 NetworkTestView()
///             }
///             .restorationBehavior(.disabled)
///         }
///     }
public struct SceneRestorationBehavior : Sendable {

    // MARK: - Checking characteristics

    /// The internal role of the scene restoration behavior.
    package var role: Role

    // MARK: - Type Properties

    /// The automatic behavior. The scene's windows will be restored as defined
    /// by the underlying platform.
    ///
    /// On macOS, this behavior is governed by a system setting which can be
    /// toggled on and off by the user. On all other platforms, it is enabled by
    /// default.
    public static let automatic: SceneRestorationBehavior = SceneRestorationBehavior(role: .automatic)

    /// The disabled behavior. The scene's windows will not be restored.
    public static let disabled: SceneRestorationBehavior = SceneRestorationBehavior(role: .disabled)

    // MARK: - Initializers

    /// Creates a scene restoration behavior with the given role.
    /// 
    /// - Parameter role: The role of the scene restoration behavior.
    package init(role: Role) {
        self.role = role
    }
}

extension SceneRestorationBehavior {

    /// The role of the scene restoration behavior.
    /// 
    package enum Role {

        // The automatic role.
        case automatic

        // The disabled role.
        case disabled
    }
}