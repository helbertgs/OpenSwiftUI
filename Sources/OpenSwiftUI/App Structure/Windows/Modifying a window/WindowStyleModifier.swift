//
// WindowStyleModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 11, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct WindowStyleModifier<Style> : Sendable, SceneModifier where Style : WindowStyle {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    nonisolated(unsafe) package let style: Style

    // MARK: - Constructor(s).

    package init(style: Style) {
        self.style = style
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }

    // MARK: - Static Function(s).

    public static func _makeScene(modifier: _GraphValue<WindowStyleModifier<Style>>, inputs: _SceneInputs) -> _SceneOutputs {
        var outputs = _SceneOutputs(inputs: inputs)
        outputs.style = modifier.value.style

        return outputs
    }
}
