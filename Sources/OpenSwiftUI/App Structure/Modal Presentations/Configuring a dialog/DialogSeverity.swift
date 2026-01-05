//
// DialogSeverity.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// The severity of an alert or confirmation dialog.
///
/// You can use dialog severity to indicate that people need to take extra
/// care when interacting with the dialog, like when an action taken from
/// the dialog permanently deletes data.
@available(Windows 10, *)
public struct DialogSeverity : Equatable, Sendable {

    // MARK: - Accessing the Raw Value
    
    /// The corresponding value of the raw type.
    package var rawValue: Int
    
    // MARK: - Creating a Value

    /// Creates a new instance with the specified raw value.
    /// 
    /// - Parameter rawValue: 
    package init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    // MARK: - Type Properties

    /// The default dialog severity. Alerts that present an error will use `.critical`
    /// and all others will use `.standard`.
    public static let automatic: DialogSeverity = .init(rawValue: 1)

    /// A severity that indicates extra attention should be given to the dialog,
    /// for example when unexpected data loss may occur as a result of the
    /// action taken.
    ///
    /// On macOS, a dialog with critical severity will display a large caution
    /// symbol with the app icon as an overlay.
    public static let critical: DialogSeverity = .init(rawValue: 2)

    /// A severity that indicates the dialog is being displayed for the purpose
    /// of presenting information to the user.
    public static let standard: DialogSeverity = .init(rawValue: 4)
}