//
// _BackgroundModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

public struct _BackgroundModifier<Background> where Background : View {

    public var background: Background
    public var alignment: Alignment

    @inlinable public init(background: Background, alignment: Alignment = .center) {
        self.background = background
        self.alignment = alignment
    }
}

extension _BackgroundModifier : ViewModifier {

    public typealias Body = Never

    public static func _makeView(
        modifier: _GraphValue<_BackgroundModifier<Background>>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
            fatalError("not implemented yet")
    }
}
