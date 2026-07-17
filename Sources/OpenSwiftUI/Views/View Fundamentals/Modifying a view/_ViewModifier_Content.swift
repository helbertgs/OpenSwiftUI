//
// _ViewModifier_Content.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct _ViewModifier_Content<Modifier> : View where Modifier: ViewModifier {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never { fatalError() }

    // MARK: - Static Function(s).

    public static func _makeView(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
}
