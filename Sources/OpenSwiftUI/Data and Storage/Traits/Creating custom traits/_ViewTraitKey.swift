//
// _ViewTraitKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

public protocol _ViewTraitKey {

    /// The type of value produced by this preference.
    associatedtype Value

    /// The default value of the Trait
    static var defaultValue: Self.Value { get }
}
