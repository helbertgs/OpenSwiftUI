//
// DynamicTypeSizekey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct DynamicTypeSizekey : EnvironmentKey {
    public static var defaultValue: DynamicTypeSize  {
        .medium
    }
}

extension EnvironmentValues {

    /// The current Dynamic Type size.
    ///
    /// This value changes as the user’s chosen Dynamic Type size changes. The default value is device-dependent.
    /// When limiting the Dynamic Type size, consider if adding a large content view with ``accessibilityShowsLargeContentViewer()`` would be appropriate.
    public var dynamicTypeSize: DynamicTypeSize  {
        get { self[DynamicTypeSizekey.self] }
        set { self[DynamicTypeSizekey.self] = newValue }
    }
}
