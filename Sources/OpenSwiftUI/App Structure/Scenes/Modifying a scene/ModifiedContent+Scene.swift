//
// ModifiedContent+Scene.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

// extension ModifiedContent : Scene where Content : Scene, Modifier : SceneModifier {
//
//     // MARK: - Property(ies).
//
//     package var body : Never { fatalError() }
//
//     // MARK: - Static Function(s).
//
//     nonisolated package static func _makeScene(scene: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _SceneInputs) -> _SceneOutputs {
//         let content = scene.value.content
//         let modifier = scene.value.modifier
//
//         var outputs = Content._makeScene(scene: _GraphValue(content), inputs: inputs)
//         outputs.modifiers.append(modifier)
//
//         return outputs
//     }
// }
//
// extension ModifiedContent : SceneModifier where Content : SceneModifier, Modifier : SceneModifier {
//
//     // MARK: - Function(s).
//
//     package func body(content: Content) -> Never {
//         fatalError()
//     }
//
//     // MARK: - Static Function(s).
//
//     nonisolated package static func _makeScene(modifier: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {fatalError()
//     }
// }

extension ModifiedContent : Scene where Content : Scene, Modifier : SceneModifier {
    public var body: Never {
        fatalError("not implemented")
    }
    
    // MARK: - Static Function(s).
    nonisolated public static func _makeScene(scene: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _SceneInputs) -> _SceneOutputs {
        let content = scene.value.content
        let modifier = scene.value.modifier

        var outputs = Content._makeScene(scene: _GraphValue(content), inputs: inputs)
        outputs.modifiers.append(modifier)

        return outputs
    }
}
