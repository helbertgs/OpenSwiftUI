//
// AllowsTighteningKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct AllowsTighteningKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {

    /// A Boolean value that indicates whether inter-character spacing should tighten to fit the text into the available space.
    ///
    /// The default value is `false`.
    public var allowsTightening: Bool {
        get { self[AllowsTighteningKey.self] }
        set { self[AllowsTighteningKey.self] = newValue }
    }
}
