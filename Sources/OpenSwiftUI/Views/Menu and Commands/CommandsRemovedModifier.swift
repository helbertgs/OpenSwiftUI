//
// CommandsRemovedModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 01, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen
public struct CommandsRemovedModifier : @MainActor SceneModifier {

    // MARK: - Constructor(s).
    
    @inlinable
    public init() { }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> some Scene {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<CommandsRemovedModifier>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError("not implemented yet")
    }
}
