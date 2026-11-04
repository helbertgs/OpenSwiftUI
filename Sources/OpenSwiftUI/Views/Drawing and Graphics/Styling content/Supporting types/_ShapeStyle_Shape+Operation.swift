//
// _ShapeStyle_Shape+Operation.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 3, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

extension _ShapeStyle_Shape {
    enum Operation {
        case copyStyle(_ShapeStyle_Name)
        case primaryStyle
        case resolveStyle(_ShapeStyle_Name, Range<Int>)
        case multiLevel
        case prepareText(Int)
        case fallbackColor(Int)
        case modifyBackground(Int)
    }
}
