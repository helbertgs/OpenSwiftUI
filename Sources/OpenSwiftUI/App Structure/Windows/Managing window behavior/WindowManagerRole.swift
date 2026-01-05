//
// WindowManagerRole.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// Options for defining how a scene's windows behave when used within a managed
/// window context, such as full screen mode and Stage Manager.
///
/// Use values of this type in conjunction with the
/// ``Scene/windowManagerRole(_:)`` modifier to override the default system
/// behavior.
///
/// For example, you can specify that a secondary `Window` scene should use the
/// principal role for full screen and Stage Manager:
///
///     struct MyApp: App {
///         var body: some Scene {
///             WindowGroup {
///                 ContentView()
///             }
///             Window("Organizer", id: "organizer") {
///                 OrganizerView()
///             }
///             .windowManagerRole(.principal)
///         }
///     }
///
@available(Windows 10, *)
public struct WindowManagerRole : Sendable {

    // MARK: - Checking characteristics

    /// The internal guts of the window manager role.
    package var guts: Guts

    // MARK: - Type Properties

    /// The automatic role. The type and configuration of the scene will be
    /// used to determine how its windows behave in full screen and Stage
    /// Manager.
    ///
    /// On macOS, ``WindowGroup`` and ``DocumentGroup`` scenes will use the
    /// `principal` role. ``Window`` scenes will use the `principal`
    /// role when they are specified as the first scene in the app's
    /// definition, and use the `associated` role otherwise. ``Settings``
    /// will use the `associated` role.
    public static let automatic: WindowManagerRole = .init(guts: .automatic)

    /// The principal role. Windows derived from this scene will show in full
    /// screen, if enabled, or in Stage Manager.
    public static let principal: WindowManagerRole = .init(guts: .principal)
    /// The associated role. Windows derived from this scene can be shown
    /// alongside windows with a `.principal` role in either full screen or
    /// Stage Manager, but do not participate in those modes on their own.
    public static let associated: WindowManagerRole = .init(guts: .associated)

    // MARK: - Initializers

    /// Creates a window manager role with the given guts.
    /// 
    /// - Parameter guts: The internal guts of the window manager role.
    package init(guts: Guts) {
        self.guts = guts
    }
}

extension WindowManagerRole {

    package enum Guts {

        // The automatic role.
        case automatic

        // The principal role.
        case principal

        // The associated role.
        case associated
    }
}