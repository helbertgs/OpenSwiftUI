//
// _ValueActionModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 20, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@frozen public struct _ValueActionModifier<Value> : ViewModifier where Value : Equatable {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var value: Value
    public var action: (Value) -> Void

    // MARK: - Constructor(s).

    @inlinable public init(value: Value, action: @escaping (Value) -> Void) {
        (self.value, self.action) = (value, action)
    }
}
