//
// CalendarKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import Swift

public struct CalendarKey : EnvironmentKey {
    public static var defaultValue: Calendar {
        .current
    }
}

extension EnvironmentValues {
    /// The current calendar that views should use when handling dates.
    var calendar : Calendar {
        get { self[CalendarKey.self] }
        set { self[CalendarKey.self] = newValue }
    }
}
