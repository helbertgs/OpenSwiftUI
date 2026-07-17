//
// EnabledKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@frozen public struct EnabledKey : EnvironmentKey {
    public static var defaultValue: Bool {
        true
    }
}

extension EnvironmentValues {

    /// A Boolean value that indicates whether the view associated with this
    /// environment allows user interaction.
    ///
    /// The default value is `true`.
    public var isEnabled: Bool {
        get { self[EnabledKey.self] }
        set { self[EnabledKey.self] = newValue }
    }
}
