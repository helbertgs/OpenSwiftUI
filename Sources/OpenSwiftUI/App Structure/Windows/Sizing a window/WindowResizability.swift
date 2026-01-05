//
// WindowResizability.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Dec 22, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// The resizability of a window.
///
/// Use the ``Scene/windowResizability(_:)`` scene modifier to apply a value
/// of this type to a ``Scene`` that you define in your ``App`` declaration.
/// The value that you specify indicates the strategy the system uses to
/// place minimum and maximum size restrictions on windows that it creates
/// from that scene.
///
/// For example, you can create a window group that people can resize to
/// between 100 and 400 points in both dimensions by applying both a frame
/// with those constraints to the scene's content, and the
/// ``WindowResizability/contentSize`` resizability to the scene:
///
///     @main
///     struct MyApp: App {
///         var body: some Scene {
///             WindowGroup {
///                 ContentView()
///                     .frame(
///                         minWidth: 100, maxWidth: 400,
///                         minHeight: 100, maxHeight: 400)
///             }
///             .windowResizability(.contentSize)
///         }
///     }
///
/// The default value for all scenes if you don't apply the modifier is
/// ``WindowResizability/automatic``. With that strategy, ``Settings``
/// windows use the ``WindowResizability/contentSize`` strategy, while
/// all others use ``WindowResizability/contentMinSize``.
@available(Windows 10, *)
public struct WindowResizability: Copyable, Equatable, Hashable, Sendable {
    
    // MARK: - Property(ies).
    
    /// The role of the window resizability.
    package let role: Role

    // MARK: - Static Property(ies).
    
    /// The automatic window resizability.
    ///
    /// When you use automatic resizability, OpenSwiftUI applies a resizing
    /// strategy that's appropriate for the scene type:
    /// * Windows from ``WindowGroup``, ``Window``, and ``DocumentGroup``
    ///   scene declarations use the ``contentMinSize`` strategy.
    /// * A window from a ``Settings`` scene declaration uses the
    ///   ``contentSize`` strategy.
    ///
    /// Automatic resizability is the default if you don't specify another
    /// value using the ``Scene/windowResizability(_:)`` scene modifier.
    public static let automatic: WindowResizability = .init(role: .automatic)
    
    /// A window resizability that's derived from the window's content.
    ///
    /// Windows that use this resizability have:
    /// * A minimum size that matches the minimum size of the window's content.
    /// * A maximum size that matches the maximum size of the window's content.
    public static let contentSize: WindowResizability = .init(role: .contentSize)
    
    /// A window resizability that's partially derived from the window's
    /// content.
    ///
    /// Windows that use this resizability have:
    /// * A minimum size that matches the minimum size of the window's content.
    /// * No maximum size.
    public static let contentMinSize: WindowResizability = .init(role: .contentMinSize)
    
    // MARK: - Constructor(s).
    
    /// Creates a window resizability with the given role.
    /// 
    /// - Parameter role: The role of the window resizability.
    package init(role: Role) {
        self.role = role
    }
}

extension WindowResizability {
    
    /// The role of the window resizability.
    package enum Role: Sendable {
        
        /// The automatic window resizability.
        case automatic
        
        /// A window resizability that's derived from the window's content.
        case contentSize
        
        /// A window resizability that's partially derived from the window's
        /// content.
        case contentMinSize
    }
}