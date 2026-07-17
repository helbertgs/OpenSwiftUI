//
// _PreferenceTransformModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Dec 22, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@frozen
public struct _PreferenceTransformModifier<Key> : @MainActor SceneModifier {
    
    // MARK: - Type Alias.
    
    public typealias Body = Never
    
    // MARK: - Property(ies).
    
    public var key: Key
    
    // MARK: - Constructor(s).
    
    @inlinable public init(key: Key) {
        self.key = key
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<_PreferenceTransformModifier<Key>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError("not implemented yet")
    }
}
