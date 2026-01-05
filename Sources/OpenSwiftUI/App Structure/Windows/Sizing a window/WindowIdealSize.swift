//
// WindowIdealSize.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

// A type which defines the size a window should use when zooming.
///
/// Use this type in conjunction with the `Scene.windowIdealSize(_:)` modifier
/// to override the default behavior for how windows behave when performing a
/// zoom.
///
/// For example, you can define a window group where the window has an ideal
/// width of 800 points and an ideal height of 600 points:
///
///     struct MyApp: App {
///         var body: some Scene {
///             WindowGroup {
///                 ContentView()
///                     .frame(idealWidth: 800, idealHeight: 600)
///             }
///             .windowIdealSize(.fitToContent)
///         }
///     }
/// 
public struct WindowIdealSize : Sendable {

    // MARK: - Checking characteristics

    /// The internal guts of the window ideal size.
    package var guts: Guts

    // MARK: - Type Properties

    /// The automatic window ideal size. Windows will use the system behavior
    /// when determining the size to use when zooming.
    public static let automatic: WindowIdealSize = .init(guts: .automatic)

    /// A window ideal size which uses the ideal size of the window's contents.
    public static let fitToContent: WindowIdealSize = .init(guts: .fitToContent)

    /// A window ideal size which uses the maximum size of the
    /// window's contents.
    public static let maximum: WindowIdealSize = .init(guts: .maximum)

    // MARK: - Initializers

    /// Creates a window ideal size with the given guts.
    /// 
    /// - Parameter guts: The internal guts of the window ideal size.
    package init(guts: Guts) {
        self.guts = guts
    }
}

extension WindowIdealSize {

    /// The internal guts of the window ideal size.
    package enum Guts {

        // The automatic window ideal size.
        case automatic

        // A window ideal size which uses the ideal size of the window's contents.
        case fitToContent

        // A window ideal size which uses the maximum size of the
        case maximum
    }
}
