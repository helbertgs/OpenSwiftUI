//
// _ValueActionModifier2.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Dec 22, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen
public struct _ValueActionModifier2<V> : @MainActor SceneModifier {

    // MARK: - Property(ies).

    public let value: V
    public let action: (V, V) -> Void

    // MARK: - Constructor(s).

    public init(value: V, action: @escaping (V, V) -> Void) {
        self.value = value
        self.action = action
    }

    public init(value: V, action: @escaping () -> Void) {
        self.value = value
        self.action = {_, _ in action() }
    }

    // MARK: - Function(s).

    public func body(content: Content) -> some Scene {
        fatalError()
    }

    public static func _makeScene(modifier: _GraphValue<_ValueActionModifier2<V>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError("not implemented yet")
    }
}
