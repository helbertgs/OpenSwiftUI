//
//  Result.swift
//  OpenSwiftUI
//
//  Created by Helbert Gomes on 2026-11-03.
//


extension _ShapeStyle_Shape {
    public enum Result {
        case preparedText(_ShapeStyle_Shape.PreparedTextResult)

        case bool(Bool)

        case none

        case pack(_ShapeStyle_Pack)

        case color(Color)

        case style(AnyShapeStyle)

    }
}
