//
// WindowToolbarStyleModifier.swift
// OpenSwiftUI
//
// Created by Mariana Rios on Jan 20, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct WindowToolbarStyleModifier<Style> : SceneModifier where Style : WindowToolbarStyle {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    nonisolated(unsafe) var style: Style

    // MARK: - Constructor(s).

    init(style: Style) {
        self.style = style
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }

    // MARK: - Static Function(s).

    public static func _makeScene(modifier: _GraphValue<WindowToolbarStyleModifier<Style>>, inputs: _SceneInputs) -> _SceneOutputs {
        var outputs = _SceneOutputs(inputs: inputs)
        outputs.windowToolbarStyle = modifier.value.style

        return outputs
    }
}
