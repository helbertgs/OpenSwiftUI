//
// SceneLaunchBehavior.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

/// The launch behavior for a scene.
///
/// Use the ``Scene/defaultLaunchBehavior(_:)`` modifier to apply a value
/// of this type to a ``Scene`` you specify in your ``App``. The value you
/// specify determines how the system will present the scene in the absense of
/// any previously restored scenes on launch of your application.
///
/// For example, you may wish to present a welcome window on launch of your
/// app when there are no previous document windows being restored:
///
///     @main
///     struct MyApp: App {
///         var body: some Scene {
///             DocumentGroup(newDocument: MyDocument()) { configuration in
///                 DocumentEditor(configuration.$document)
///             }
///
///             Window("Welcome to My App", id: "welcome") {
///                 WelcomeView()
///             }
///             .defaultLaunchBehavior(.presented)
///         }
///     }
public struct SceneLaunchBehavior : Sendable {

    // MARK: - Checking characteristics

    /// The internal role of the scene launch behavior.
    package var role: Role

    // MARK: - Type Properties

    /// The automatic behavior.
    ///
    /// A scene with the automatic behavior will present itself on launch if it
    /// is the first scene defined by an app and no other scenes have presented
    /// themselves.
    public static let automatic: SceneLaunchBehavior = SceneLaunchBehavior(role: .automatic)

    /// The presented behavior. The scene will present itself in the absence of
    /// any previously restored scenes.
    public static let presented: SceneLaunchBehavior = SceneLaunchBehavior(role: .presented)

    /// The suppressed behavior. The scene will not present itself in the
    /// absence of any previously restored scenes.
    public static let suppressed: SceneLaunchBehavior = SceneLaunchBehavior(role: .suppressed)

    // MARK: - Initializers

    /// Creates a scene launch behavior with the given role.
    /// 
    /// - Parameter role: The role of the scene launch behavior.
    package init(role: Role) {
        self.role = role
    }
}

extension SceneLaunchBehavior {

    /// The role of the scene launch behavior.
    /// 
    package enum Role {

        // The automatic role.
        case automatic

        // The presented role.
        case presented

        // The suppressed role.
        case suppressed
    }
}