//
// WindowDefaultsSizeModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Dec 22, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenSpatial

public struct WindowDefaultsSizeModifier : @MainActor SceneModifier {
    
    // MARK: - Property(ies).
    
    public let width: Double
    public let height: Double
    
    // MARK: - Constructor(s).
    
    public init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }
    
    // MARK: - Static Function(s).
    
    public static func _makeScene(modifier: _GraphValue<WindowDefaultsSizeModifier>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError()
    }
}
