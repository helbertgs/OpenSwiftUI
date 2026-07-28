//
// _ConditionalTraitWritingModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

@frozen
public struct _ConditionalTraitWritingModifier<Trait> where Trait : _ViewTraitKey {

    public var value: Trait.Value
    public var isEnabled: Bool

    public init(traitKey: Trait.Type = Trait.self, value: Trait.Value, isEnabled: Bool) {
        self.value = value
        self.isEnabled = isEnabled
    }

    public static func _makeView(
        modifier: _GraphValue<_ConditionalTraitWritingModifier<Trait>>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        fatalError("not implemented yet")
    }

    public static func _makeViewList(
        modifier: _GraphValue<_ConditionalTraitWritingModifier<Trait>>,
        inputs: _ViewListInputs,
        body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs
    ) -> _ViewListOutputs {
        fatalError("not implemented yet")
    }

    public static func _viewListCount(
        inputs: _ViewListCountInputs,
        body: (_ViewListCountInputs) -> Int?
    ) -> Int? {
        fatalError("not implemented yet")
    }
}

extension _ConditionalTraitWritingModifier : ViewModifier {
    public typealias Body = Never
}
