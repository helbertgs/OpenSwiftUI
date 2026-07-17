//
// EnvironmentPropertyKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
 
class AnyEnvironmentPropertyKey: @unchecked Sendable { }

final class EnvironmentPropertyKey<Key>: AnyEnvironmentPropertyKey, CustomStringConvertible, @unchecked Sendable where Key: EnvironmentKey {

    // MARK: - Property(ies).

    let value: Key.Value

    // MARK: - Constructor(s).

    init(_ value: Key.Value) {
        self.value = value
    }

    // MARK: - CustomStringConvertible

    var description: String {
        "\(Self.self) = \(value)"
    }
}
