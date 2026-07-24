//
// _ContainerShapeModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen
public struct _ContainerShapeModifier<Shape> : ViewModifier where Shape : InsettableShape {

    public var shape: Shape

    @inlinable
    public init(shape: Shape) { self.shape = shape }

    public static func _makeView(
        modifier: _GraphValue<_ContainerShapeModifier<Shape>>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        fatalError("not implemented yet")
    }

    public typealias Body = Never
}
