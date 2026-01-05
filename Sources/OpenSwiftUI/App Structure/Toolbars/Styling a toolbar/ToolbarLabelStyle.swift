//
// ToolbarLabelStyle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// The label style of a toolbar.
///
/// Use this type in conjunction with modifiers like ``Scene/windowToolbarLabelStyle(fixed:)``
/// and ``Scene/windowToolbarLabelStyle(_:)`` to customize the appearance of window toolbars
/// managed by OpenSwiftUI.
@available(Windows 11, *)
public struct ToolbarLabelStyle : Sendable, Equatable {

    // MARK: - Checking characteristics

    /// The internal role of the toolbar style.
    package var role: Role

    // MARK: - Type Properties

    /// The automatic label style. The toolbar will use a labelStyle that best fits
    /// the `Scene` it is applied to.
    public static let automatic: ToolbarLabelStyle = .init(role: .automatic)

    /// The title and icon label style. The toolbar contents will display both a control and title
    public static let titleAndIcon: ToolbarLabelStyle = .init(role: .titleAndIcon)

    /// The icon only label style. The toolbar contents will only display the control
    public static let iconOnly: ToolbarLabelStyle = .init(role: .iconOnly)

    /// The title only label style. The toolbar contents will only display the title
    public static let titleOnly: ToolbarLabelStyle = .init(role: .titleOnly)

    // MARK: - Initializers

    /// Creates a toolbar style with the given role.
    /// 
    /// - Parameter role: The internal role of the toolbar style.
    package init(role: Role) {
        self.role = role
    }
}

extension ToolbarLabelStyle {

    /// The role of the toolbar style.
    package enum Role {

        // The automatic toolbar style.
        case automatic

        // The title and icon from toolbar style.
        case titleAndIcon

        // The icon only toolbar style.
        case iconOnly

        // The title only toolbar style.
        case titleOnly
    }
}