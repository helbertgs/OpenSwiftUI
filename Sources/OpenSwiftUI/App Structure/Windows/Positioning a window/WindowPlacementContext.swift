//
// WindowPlacementContext.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// A type which represents contextual information used for sizing and
/// positioning windows.
///
/// The placement context provides information to be used when providing a new
/// placement via the closure provided to the `defaultWindowPlacement(_:)`
/// modifier.
@available(Windows 10, *)
public struct WindowPlacementContext {

    // MARK: - Instance Properties

    /// The display on which new windows will be presented by default.
    ///
    /// On macOS, this is typically the display which currently has focus.
    public let defaultDisplay: DisplayProxy

    /// The list of current active scenes
    public let windows: [WindowProxy] 

    // MARK: - Initializers

    /// Creates a new window placement context.
    /// 
    /// - Parameters:
    ///   - defaultDisplay: The display on which new windows will be presented by default.
    ///   - windows: The list of current active scenes.
    public init(defaultDisplay: DisplayProxy, windows: [WindowProxy]) {
        self.defaultDisplay = defaultDisplay
        self.windows = windows
    }
}