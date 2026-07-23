//
// DisplayProxyKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import Swift

struct DisplayProxyKey : EnvironmentKey {
    static var defaultValue: DisplayProxy? {
        nil
    }
}

extension EnvironmentValues {
    var displayProxy : DisplayProxy? {
        get { self[DisplayProxyKey.self] }
        set { self[DisplayProxyKey.self] = newValue }
    }
}
