//
// WindowProxyKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import Swift

struct WindowProxyKey : EnvironmentKey {
    static var defaultValue: WindowProxy? {
        nil
    }
}

extension EnvironmentValues {
    var windowProxy : WindowProxy? {
        get { self[WindowProxyKey.self] }
        set { self[WindowProxyKey.self] = newValue }
    }
}
