//
// WindowInteractionBehavior.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 5, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

// Options for enabling and disabling window interaction behaviors.
///
/// Use values of this type in conjunction with the following view and scene
/// modifiers to adjust the supported functionality for the window:
///
/// - ``View/windowDismissBehavior(_:)``
/// - ``View/windowMinimizeBehavior(_:)``
/// - ``View/windowFullScreenBehavior(_:)``
/// - ``View/windowResizeBehavior(_:)``
/// - ``Scene/windowBackgroundDragBehavior(_:)``
///
/// For example, you can create a custom "About" window which only allows for
/// dismissal:
///
///     struct MyApp: App {
///         var body: some Scene {
///             ...
///             Window("About MyApp", id: "about") {
///                 AboutView()
///                     .windowMinimizeBehavior(.disabled)
///                     .windowResizeBehavior(.disabled)
///             }
///             .windowResizability(.contentSize)
///         }
///     }
public struct WindowInteractionBehavior : Sendable {

    // MARK: - Checking characteristics

    /// The internal guts of the window interaction behavior.
    package var guts: Guts

    /// The automatic behavior. The associated window behavior will be enabled
    /// or disabled depending on the configuration of the enclosing `Scene`.
    public static let automatic: WindowInteractionBehavior = .init(guts: .automatic)

    /// The enabled behavior. The associated window interaction behavior will be
    /// enabled.
    public static let enabled: WindowInteractionBehavior = .init(guts: .enabled)

    /// The disabled behavior. The associated window interaction behavior will
    /// be disabled.
    public static let disabled: WindowInteractionBehavior = .init(guts: .disabled)

    // MARK: - Creating a window interaction behavior

    /// Creates a window interaction behavior with the given guts.
    ///
    /// - Parameter guts: The internal guts of the window interaction behavior.
    package init(guts: Guts) {
        self.guts = guts
    }
}

extension WindowInteractionBehavior {

    /// The internal guts of the window interaction behavior.
    package enum Guts : String, Equatable, Sendable {

        /// The automatic role.
        case automatic

        /// The enabled role.
        case enabled

        /// The disabled role.
        case disabled
    }
}