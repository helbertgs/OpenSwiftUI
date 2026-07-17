//
// WidgetBundleBuilder.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// A custom attribute that constructs a widget bundle’s body.
@frozen @resultBuilder public struct WidgetBundleBuilder {
    public static func buildBlock() -> some Widget {
        EmptyWidget()
    }
}
