//
// SettingsLink.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 5, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A view that opens the Settings scene defined by an app.
///
/// On Windows, clicking on the link opens the window for the scene
/// or orders it to the front if it is already open.
public struct SettingsLink<Label> : View where Label : View {

    // MARK: - Checking characteristics.

    /// The label of the settings link.
    ///
    /// - Parameter label: A view to use as the label for this settings link.
    package let label: Label

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

    // MARK: - Creating a settings link.

    /// Creates a settings link with the default system label.
    ///
    /// The display of the label may be customized using the ``labelStyle(_:)`` modifier.
    public init() where Label == DefaultSettingsLinkLabel {
        self.label = DefaultSettingsLinkLabel()
    }

    /// Creates a settings link with a custom label.
    ///
    /// - Parameter label: A view to use as the label for this settings link.
    public init(@ViewBuilder label: () -> Label) {
        self.label = label()
    }

    // MARK: - Creating a settings link's representation in the OpenSwiftUI view graph.

    /// Creates the settings link's representation in the OpenSwiftUI view graph.
    ///
    /// - Parameters:
    ///   - view: The settings link to create.
    ///   - inputs: The inputs for the view.
    /// - Returns: The outputs for the view.
    public static func _makeView(view: _GraphValue<SettingsLink<Label>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("not implemented yet")
    }
}