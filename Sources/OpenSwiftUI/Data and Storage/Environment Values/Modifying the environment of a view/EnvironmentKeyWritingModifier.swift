//
// EnvironmentKeyWritingModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@MainActor 
@frozen public struct _EnvironmentKeyWritingModifier<Value> {

    // MARK: - Type Alias.
    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    // MARK: - Property(ies).
    var keyPath: WritableKeyPath<EnvironmentValues, Value>

    // The value.
    var value: Value

    // MARK: - Constructor(s).
    
    public init(keyPath: WritableKeyPath<EnvironmentValues, Value>, value: Value) {
        self.keyPath = keyPath
        self.value = value
    }
}

extension _EnvironmentKeyWritingModifier : ViewModifier {
    public static func _makeView(modifier: _GraphValue<_EnvironmentKeyWritingModifier<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        .init()
    }
}

extension _EnvironmentKeyWritingModifier : @MainActor  SceneModifier {
    @MainActor public static func _makeScene(modifier: _GraphValue<_EnvironmentKeyWritingModifier<Value>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError()
    }
}