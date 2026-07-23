//
// MenuBarExtraStyleModifier.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen
public struct MenuBarExtraStyleModifier<Style> : SceneModifier, Sendable where Style : MenuBarExtraStyle {
    
    // MARK: - Property(ies).
    
    nonisolated(unsafe) public let style: Style
    
    // MARK: - Constructor(s).
    
    @inlinable
    public init(style: Style) {
        self.style = style
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> some Scene {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<MenuBarExtraStyleModifier<Style>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError()
    }
}
