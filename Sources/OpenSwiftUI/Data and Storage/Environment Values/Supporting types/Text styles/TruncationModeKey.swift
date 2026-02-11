//
// TruncationModeKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct TruncationModeKey : EnvironmentKey {
    public static var defaultValue: Text.TruncationMode {
        .tail
    }
}

extension EnvironmentValues {

    /// A value that indicates how the layout truncates the last line of text to fit into the available space.
    ///
    /// The default value is ``Text.TruncationMode.tail``.
    /// Some controls, however, might have a different default if appropriate.
    public var truncationMode: Text.TruncationMode {
        get { self[TruncationModeKey.self] }
        set { self[TruncationModeKey.self] = newValue }
    }
}
