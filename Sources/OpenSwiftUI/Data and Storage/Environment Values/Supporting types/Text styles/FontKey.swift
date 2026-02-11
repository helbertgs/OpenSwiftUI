//
// FontKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct FontKey : EnvironmentKey {
    public static var defaultValue: Font? {
        nil
    }
}

extension EnvironmentValues {

    /// The default font of this environment.
    ///
    /// The default value is `nil`.
    public var font: Font? {
        get { self[FontKey.self] }
        set { self[FontKey.self] = newValue }
    }
}
