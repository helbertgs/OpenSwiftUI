//
// WindowDefaultsPositionModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Dec 22, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenSpatial

public struct WindowDefaultsPositionModifier : @MainActor SceneModifier {
    
    // MARK: - Property(ies).
    
    public let position: UnitPoint
    
    // MARK: - Constructor(s).
    
    public init(_ position: UnitPoint) {
        self.position = position
    }

    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }
    
    // MARK: - Static Function(s).
    
    public static func _makeScene(modifier: _GraphValue<WindowDefaultsPositionModifier>, inputs: _SceneInputs) -> _SceneOutputs {
       fatalError()
    }
}
