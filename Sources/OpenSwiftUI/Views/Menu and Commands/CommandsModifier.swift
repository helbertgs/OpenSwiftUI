//
// CommandsModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 11, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct CommandsModifier<Value> : @MainActor SceneModifier where Value : Commands {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    var value : Value

    // MARK: - Constructor(s).

    init(value: Value) {
        self.value = value
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }

    // MARK: - Static Function(s).

    nonisolated public static func _makeScene(modifier: _GraphValue<CommandsModifier<Value>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError()
    }
}
