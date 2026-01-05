//
// SceneModifier_Content.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

@MainActor @preconcurrency public struct SceneModifier_Content<Modifier> : Scene where Modifier : SceneModifier {

    public var body: Never { fatalError() }

    // MARK: - Static Function(s).

    public static func _makeScene(scene: _GraphValue<SceneModifier_Content<Modifier>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError()
    }
}
