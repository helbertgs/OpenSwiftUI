//
// WidgetBundle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// A container used to expose multiple widgets from a single widget extension.
public protocol WidgetBundle {

    // MARK: - Associated Type(s).

    /// The type of widget that represents the content of the bundle.
    associatedtype Body: Widget

    // MARK: - Property(ies).

    /// Declares the group of widgets that an app supports.
    @WidgetBundleBuilder var body : Self.Body { get }

    // MARK: - Constructor(s).

    /// Creates a widget bundle using the bundle’s body as its content.
    init()

    // MARK: - Static Function(s).

    /// Initializes and runs the widget bundle.
    static func main()
}
