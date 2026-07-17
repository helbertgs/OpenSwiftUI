//
// AppDefaultStorageKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import Swift

struct DefaultAppStorageKey : EnvironmentKey {
    static var defaultValue: UserDefaults {
        .standard
    }
}

extension EnvironmentValues {
    /// The current calendar that views should use when handling dates.
    var defaultAppStorage : UserDefaults {
        get { self[DefaultAppStorageKey.self] }
        set { self[DefaultAppStorageKey.self] = newValue }
    }
}
