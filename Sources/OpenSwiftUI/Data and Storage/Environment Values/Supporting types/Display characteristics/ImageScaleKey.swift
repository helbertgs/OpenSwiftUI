//
// ImageScaleKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct ImageScaleKey : EnvironmentKey {
    public static var defaultValue: Image.Scale {
        .medium
    }
}

extension EnvironmentValues {
    /// The image scale for this environment.
    public var imageScale: Image.Scale {
        get { self[ImageScaleKey.self] }
        set { self[ImageScaleKey.self] = newValue }
    }
}
