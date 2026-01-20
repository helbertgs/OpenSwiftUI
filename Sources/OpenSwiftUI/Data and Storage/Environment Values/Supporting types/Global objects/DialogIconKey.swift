//
// DialogIconKey.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

struct DialogIconKey : EnvironmentKey {
    static var defaultValue: Image? {
        nil
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func _valuesEqual(_ lhs: Image?, _ rhs: Image?) -> Bool {
        true
    }
}

extension EnvironmentValues {
    var dialogIcon: Image? {
        get { self[DialogIconKey.self] }
        set { self[DialogIconKey.self] = newValue }
    }
}
