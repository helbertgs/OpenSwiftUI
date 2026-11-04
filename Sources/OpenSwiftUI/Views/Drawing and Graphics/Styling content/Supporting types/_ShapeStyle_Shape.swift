//
// _ShapeStyle_Shape.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 3, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
// 

import Foundation
import OpenSpatial

public struct _ShapeStyle_Shape {
    var activeRecursiveStyles: [_ShapeStyle_Shape.RecursiveStyle] = []
    var effectiveForegroundStyle: AnyShapeStyle {
        fatalError("not implemented yet")
    }

    var bounds: Rect3D? = nil
    var currentForegroundStyle: AnyShapeStyle? = nil
    var environment: EnvironmentValues
    var foregroundStyle: AnyShapeStyle? = nil
    var operation: _ShapeStyle_Shape.Operation
    var result: _ShapeStyle_Shape.Result
    var role: ShapeRole
    var stylePack: _ShapeStyle_Pack = .init()

    func applyingOpacity(at: Int, to: Color.Resolved) -> Color.Resolved {
        fatalError("not implemented yet")
    }

    func applyingOpacity(at: Int, to: Color) -> Color {
        fatalError("not implemented yet")
    }

    func opacity(at: Int) -> Double {
        fatalError("not implemented yet")
    }

    func opacity(for: Color, at: Int) -> Double {
        fatalError("not implemented yet")
    }

    init(operation: _ShapeStyle_Shape.Operation, result: _ShapeStyle_Shape.Result, environment: EnvironmentValues, foregroundStyle: AnyShapeStyle?, bounds: Rect3D?, role: ShapeRole) {
        self.operation = operation
        self.result = result
        self.environment = environment
        self.foregroundStyle = foregroundStyle
        self.bounds = bounds
        self.role = role
    }
}
