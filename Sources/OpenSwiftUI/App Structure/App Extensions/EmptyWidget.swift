//
// EmptyWidget.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@frozen public struct EmptyWidget : Widget {

    // MARK: - Associated Type(s).

    /// The type of configuration representing the content of the widget.
    public typealias Body = EmptyWidgetConfiguration

    // MARK: - Property(ies).

    /// The content and behavior of the widget.
    public var body : Self.Body {
        .init()
    }

    // MARK: - Constructor(s).

    /// Creates a widget using body as its content.
    public init() { }

    // MARK: - Static Function(s).

    /// Initializes and runs the widget.
    public static func main() { }
}
