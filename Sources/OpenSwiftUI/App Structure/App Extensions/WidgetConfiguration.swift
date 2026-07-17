//
// WidgetConfiguration.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// A type that describes a widget’s content.
public protocol WidgetConfiguration {

    // MARK: - Associated Type(s).

    /// The type of widget configuration representing the body of this configuration.
    associatedtype Body: WidgetConfiguration

    // MARK: - Property(ies).

    /// The content and behavior of the widget.
    var body : Self.Body { get }
}
