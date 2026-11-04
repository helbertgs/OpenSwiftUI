//
//  Operation.swift
//  OpenSwiftUI
//
//  Created by Helbert Gomes on 2026-11-03.
//


extension _ShapeStyle_Shape {
    public enum Operation {
        case copyStyle(_ShapeStyle_Name)

        case primaryStyle

        case resolveStyle(_ShapeStyle_Name, Range<Int>)

        case multiLevel

        case prepareText(Int)

        case fallbackColor(Int)

        case modifyBackground(Int)

    }
}
