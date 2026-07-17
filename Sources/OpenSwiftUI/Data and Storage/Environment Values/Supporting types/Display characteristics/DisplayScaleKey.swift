//
// DisplayScaleKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct DisplayScaleKey : EnvironmentKey {
    public static var defaultValue: Float {
        0
    }
}

extension EnvironmentValues {
    /// The display scale of this environment.
    var displayScale: Float {
        get { self[DisplayScaleKey.self] }
        set { self[DisplayScaleKey.self] = newValue }
    }

    /// The size of a pixel on the screen.
    ///
    /// This value is usually equal to `1` divided by
    /// ``EnvironmentValues/displayScale``.
    var pixelLength : Float {
        1.0 / displayScale
    }
}
