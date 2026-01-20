//
// WindowToolbarLabelStyleModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

@MainActor @preconcurrency public struct WindowToolbarLabelStyleModifier : SceneModifier {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    var data: Data

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
        inputs
    }
}

extension WindowToolbarLabelStyleModifier {
    enum Data {
        case fixed(ToolbarLabelStyle)
        case variable(Binding<ToolbarLabelStyle>)
    }
}