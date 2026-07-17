//
// AnyLocation.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 18, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

open class AnyLocation<Value>: AnyLocationBase, @unchecked Sendable {

    public var value: Value

    public init(value: Value) {
        self.value = value
    }
}

extension AnyLocation: Equatable where Value: Equatable {
    public static func == (_ lhs: AnyLocation<Value>, _ rhs: AnyLocation<Value>) -> Bool {
        lhs.value == rhs.value
    }
}