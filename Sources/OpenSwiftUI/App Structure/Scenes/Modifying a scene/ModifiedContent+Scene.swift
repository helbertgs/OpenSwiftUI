//
// ModifiedContent+Scene.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

extension ModifiedContent : Scene where Content : Scene, Modifier : SceneModifier {
    public var body: Never {
        fatalError("not implemented")
    }
    
    // MARK: - Static Function(s).
    public static func _makeScene(scene: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _SceneInputs) -> _SceneOutputs {
        let cOutputs = Content._makeScene(scene: .init(scene.value.content), inputs: inputs)
        let mOutputs = Modifier._makeScene(modifier: .init(scene.value.modifier), inputs: cOutputs)

        return mOutputs
    }
}