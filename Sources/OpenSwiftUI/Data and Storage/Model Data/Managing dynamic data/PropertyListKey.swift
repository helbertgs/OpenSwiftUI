//
// PropertyListKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

// MARK: - PropertyListKey

/// A key that can be stored in a `PropertyList`.
///
/// Analogous to `EnvironmentKey` and `TransactionKey`, but more general — both
/// of those are built on top of this protocol.
public protocol PropertyListKey {
    associatedtype Value
    static var defaultValue: Value { get }
}