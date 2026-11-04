//
// _ShapeStyle_Shape+Result.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 3, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

extension _ShapeStyle_Shape {
    enum Result {
//        case preparedText(_ShapeStyle_Shape.PreparedTextResult)
        case bool(Bool)
        case none
        case pack(_ShapeStyle_Pack)
        case color(Color)
        case style(AnyShapeStyle)
    }
}
