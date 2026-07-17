//
// ActivationConditionsModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Dec 22, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen
public struct ActivationConditionsModifier : SceneModifier {
    
    // MARK: - Property(ies).
    
    public let conditions: Set<String>
    
    // MARK: - Constructor(s).
    
    public init(conditions: Set<String>) {
        self.conditions = conditions
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> some Scene {
        fatalError()
    }
    
    // MARK: - Static Function(s).
    
    public static func _makeScene(modifier: _GraphValue<ActivationConditionsModifier>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError("not implemented yet")
    }
}
