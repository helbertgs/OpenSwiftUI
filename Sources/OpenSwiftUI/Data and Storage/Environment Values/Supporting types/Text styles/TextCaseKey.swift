//
// TextCaseKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct TextCaseKey : EnvironmentKey {
    public static var defaultValue: Text.Case? {
        nil
    }
}

extension EnvironmentValues {

    /// A stylistic override to transform the case of Text when displayed, using the environment’s locale.
    ///
    /// The default value is nil, displaying the Text without any case changes.
    public var textCase: Text.Case? {
        get { self[TextCaseKey.self] }
        set { self[TextCaseKey.self] = newValue }
    }
}
