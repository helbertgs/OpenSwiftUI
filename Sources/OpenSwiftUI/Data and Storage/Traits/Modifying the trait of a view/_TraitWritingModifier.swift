//
// _TraitWritingModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

@frozen
public struct _TraitWritingModifier<Trait> where Trait : _ViewTraitKey {

    public let value: Trait.Value

    @inlinable public init(value: Trait.Value) {
        self.value = value
    }

    public static func _makeView(
        modifier: _GraphValue<_TraitWritingModifier<Trait>>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        fatalError("not implemented yet")
    }

    public static func _makeViewList(
        modifier: _GraphValue<_TraitWritingModifier<Trait>>,
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

extension _TraitWritingModifier : ViewModifier {

    public typealias Body = Never
}
