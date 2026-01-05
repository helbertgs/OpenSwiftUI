//
// WindowLevel.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

/// The level of a window.
///
/// Use this in conjunction with the `.windowLevel(_:)` modifier to control
/// window levels.
@available(Windows 11, *)
public struct WindowLevel : Equatable, Hashable, Sendable {

    // MARK: - Checking characteristics

    /// The internal storage of the window level.
    package var storage: Storage

    // MARK: - Type Properties

    /// Automatic window level.
    ///
    /// SwiftUI will use applicable level accordingly based on factors like
    /// scene type and window style.
    public static let automatic: WindowLevel = .init(storage: .automatic)

    /// Desktop window level.
    ///
    /// Use this if you want your window to appear just on top of wallpaper and
    /// behind everything else.
    public static let desktop: WindowLevel = .init(storage: .desktop)

    /// Floating window level.
    ///
    /// Use this if your window needs to function as a utility window and stay
    /// on top of other windows, for example, a PIP (picture-in-picture) window.
    public static let floating: WindowLevel = .init(storage: .floating)

    /// Normal window level.
    ///
    /// Use this if you want your scene to have the normal window level instead
    /// of the level computed by ``WindowLevel/automatic``.
    public static let normal: WindowLevel = .init(storage: .normal)

    // MARK: - Initializers

    /// Creates a window level with the given storage.
    /// 
    /// - Parameter storage: The internal storage of the window level.
    package init(storage: Storage) {
        self.storage = storage
    }
}

extension WindowLevel {
    package enum Storage : String, Equatable, Hashable, Sendable {

        /// The automatic level.
        case automatic

        /// The desktop level.
        case desktop

        /// The floating level.
        case floating

        /// The normal level.
        case normal
    }
}