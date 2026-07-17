//
// _GraphInputsModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 11, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public protocol _GraphInputsModifier {
    static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs)
}
