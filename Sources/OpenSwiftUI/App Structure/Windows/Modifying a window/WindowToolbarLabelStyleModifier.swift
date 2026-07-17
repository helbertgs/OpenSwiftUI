//
// WindowToolbarLabelStyleModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

public struct WindowToolbarLabelStyleModifier : SceneModifier {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    nonisolated(unsafe) var data: Data

    // MARK: - Constructor(s).

    init(data: Data) {
        self.data = data
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }

    // MARK: - Static Function(s).

    public static func _makeScene(modifier: _GraphValue<WindowToolbarLabelStyleModifier>, inputs: _SceneInputs) -> _SceneOutputs {
        var outputs = _SceneOutputs(inputs: inputs)
        switch modifier.value.data {
        case .fixed(let style):
            outputs.toolbarLabelStyle = style
        case .variable(let style):
            outputs.toolbarLabelStyle = style.wrappedValue
        }
        return outputs
    }
}

extension WindowToolbarLabelStyleModifier {

    /// A type that describes the label style to apply to a window's toolbar.
    enum Data {

        /// A fixed label style.
        case fixed(ToolbarLabelStyle)

        /// A variable label style, that can be updated at runtime.
        case variable(Binding<ToolbarLabelStyle>)
    }
}