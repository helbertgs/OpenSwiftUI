//
// TransactionKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

/// A key for values carried inside a `Transaction`.
///
/// Mirrors SwiftUI's `TransactionKey`. Implement this protocol to attach
/// custom metadata to a transaction — for example, animation intent.
public protocol TransactionKey: PropertyListKey {}

// MARK: - Built-in keys

/// Carries the `Animation` associated with a transaction, if any.
public enum AnimationKey: TransactionKey {
    public static let defaultValue: Animation? = nil
}
