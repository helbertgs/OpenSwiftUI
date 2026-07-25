//
// PropertyListKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

/// A key that can be stored in a `PropertyList`.
///
/// Analogous to `EnvironmentKey` and `TransactionKey`, but more general — both
/// of those are built on top of this protocol.
public protocol PropertyListKey {

    /// The associated type representing the type of the property key's value.
    associatedtype Value

    /// The default value for the property key.
    static var defaultValue: Self.Value { get }
}