//
// _ShapeStyle_ShapeType.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 3, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

public struct _ShapeStyle_ShapeType : Equatable, Hashable, Sendable  {
    var operation: _ShapeStyle_ShapeType.Operation
    var result: _ShapeStyle_ShapeType.Result

    init(operation: _ShapeStyle_ShapeType.Operation, result: _ShapeStyle_ShapeType.Result) {
        self.operation = operation
        self.result = result
    }
}

extension _ShapeStyle_ShapeType {
    enum Operation : Equatable, Hashable, Sendable {
        case modifiesBackground
        case none
    }
}

extension _ShapeStyle_ShapeType {
    enum Result : Equatable, Hashable, Sendable {
        case bool(Bool)
        case none
    }
}
