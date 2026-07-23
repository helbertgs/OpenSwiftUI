//
// DefaultSettingsLinkLabel.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 5, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// The default label to use for a settings link.
///
/// You don't use this type directly. Instead, the system creates it
/// automatically when you construct a ``SettingsLink`` with the default label.
public struct DefaultSettingsLinkLabel: View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that OpenSwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    public var body: Never {
        fatalError()
    }

    // MARK: - Creating a default settings link label.

    /// Creates a default settings link label.
    public init() { }

    // MARK: - Creating a default settings link label's representation in the OpenSwiftUI view graph.

    /// Creates the default settings link label's representation in the OpenSwiftUI view graph.
    ///
    /// - Parameters:
    ///   - view: The default settings link label to create.
    ///   - inputs: The inputs for the view.
    /// - Returns: The outputs for the view.
    public static func _makeView(view: _GraphValue<DefaultSettingsLinkLabel>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("not implemented yet")
    }
}