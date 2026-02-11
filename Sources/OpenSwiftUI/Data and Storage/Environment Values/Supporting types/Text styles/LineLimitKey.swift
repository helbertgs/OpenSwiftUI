//
// LineLimitKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct LineLimitKey : EnvironmentKey {
    public static var defaultValue: Int? {
        nil
    }
}

extension EnvironmentValues {

    /// The maximum number of lines that text can occupy in a view.
    ///
    /// The maximum number of lines is 1 if the value is less than 1. If the value is nil, the text uses as many lines as required. The default is nil.
    public var lineLimit: Int? {
        get { self[LineLimitKey.self] }
        set { self[LineLimitKey.self] = newValue }
    }
}
