//
// EnvironmentValues+WindowSize.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

private struct WindowSizeKey: EnvironmentKey {
    static let defaultValue: Size3D = .init(width: 900, height: 450, depth: 0)
}

extension EnvironmentValues {
    public var windowSize: Size3D {
        get { self[WindowSizeKey.self] }
        set { self[WindowSizeKey.self] = newValue }
    }
}
