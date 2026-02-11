//
// LineSpacingKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct LineSpacingKey : EnvironmentKey {
    public static var defaultValue: Double {
        0
    }
}

extension EnvironmentValues {

    /// The distance in points between the bottom of one line fragment and the top of the next.
    ///
    /// This value is always nonnegative.
    public var lineSpacing: Double {
        get { self[LineSpacingKey.self] }
        set { self[LineSpacingKey.self] = newValue }
    }
}
