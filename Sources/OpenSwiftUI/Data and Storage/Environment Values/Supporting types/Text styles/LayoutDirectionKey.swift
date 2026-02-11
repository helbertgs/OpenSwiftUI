//
// LayoutDirectionKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct LayoutDirectionKey : EnvironmentKey {
    public static var defaultValue: LayoutDirection {
        .leftToRight
    }
}

extension EnvironmentValues {

    /// The layout direction associated with the current environment.
    ///
    /// Use this value to determine or set whether the environment uses a left-to-right or right-to-left direction.
    public var layoutDirection: LayoutDirection {
        get { self[LayoutDirectionKey.self] }
        set { self[LayoutDirectionKey.self] = newValue }
    }
}
