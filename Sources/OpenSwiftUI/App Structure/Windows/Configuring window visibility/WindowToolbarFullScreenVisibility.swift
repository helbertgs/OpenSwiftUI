//
// WindowToolbarFullScreenVisibility.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 5, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// The visibility of the window toolbar with respect to full screen mode.
///
/// Use values of this type in conjunction with the
/// ``View/windowToolbarFullScreenVisibility(_:)`` modifier to configure how
/// the window toolbar displays itself when the window enters full screen mode.
///
/// For example, you can specify that the window toolbar should be hidden by
/// default, and only show when the mouse moves into the area occupied by the
/// menu bar:
///
///     struct RootView: View {
///         var body: some View {
///             ContentView()
///                 .toolbar {
///                     ...
///                 }
///                 .windowToolbarFullScreenVisibility(.onHover)
///         }
///     }
///
public struct WindowToolbarFullScreenVisibility : Sendable {

    // MARK: - Checking characteristics

    /// The internal role of the window toolbar full screen visibility.
    package var role: Role

    /// The window toolbar visibility will be defined by the system default
    /// behavior.
    public static let automatic: WindowToolbarFullScreenVisibility = .init(role: .automatic)

    /// Prefer to show window toolbar when the window is in full screen mode.
    ///
    /// This has no effect if the toolbar is completely hidden, i.e. setting
    /// the visibility to `hidden` for `windowToolbar` placements using
    /// ``View/toolbarVisibility(_:for:)`` will cause the toolbar to remain
    /// completely hidden, even in full screen.
    public static let visible: WindowToolbarFullScreenVisibility = .init(role: .visible)

    /// Hide the window toolbar in full screen mode by default. It will reveal
    /// itself when the mouse moves into the area occupied by the menu bar.
    ///
    /// This has no effect if the toolbar is completely hidden, i.e. setting
    /// the visibility to `hidden` for `windowToolbar` placements using
    /// ``View/toolbarVisibility(_:for:)`` will cause the toolbar to remain
    /// completely hidden, even in full screen.
    public static let onHover: WindowToolbarFullScreenVisibility = .init(role: .onHover)

    // MARK: - Creating a window toolbar full screen visibility

    /// Creates a window toolbar full screen visibility with the given role.
    ///
    /// - Parameter role: The role of the window toolbar full screen visibility.
    package init(role: Role) {
        self.role = role
    }
}

extension WindowToolbarFullScreenVisibility {

    /// The role of the window toolbar full screen visibility.
    package enum Role : String, Equatable, Sendable {

        /// The automatic role.
        case automatic
        /// The visible role.
        case visible
        /// The on hover role.
        case onHover
    }
}