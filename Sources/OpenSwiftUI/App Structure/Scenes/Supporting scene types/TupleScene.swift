//
// TupleScene.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// A Scene created from a swift tuple of Scene values.
@available(Windows 10, *)
@frozen public struct _TupleScene<T> {

    // MARK: - Checking characteristics.

    /// The value of the tuple scene.
    public var value: T

    // MARK: - Creating a tuple scene.

    /// Creates a tuple scene instance with the given value.
    /// 
    /// - Parameter value: The value to initialize the tuple scene with.
    @inlinable public init(_ value: T) {
        self.value = value
    }
}

@available(Windows 10, *)
extension _TupleScene: Scene {

    /// The type of scene body.
    public var body: Never { fatalError() }

    /// Creates the scene representation of this scene.
    /// 
    /// - Parameters:
    ///   - scene: The scene to create.
    ///   - inputs: The inputs for the scene.
    /// - Returns: The outputs of the scene.
    nonisolated public static func _makeScene(scene: _GraphValue<_TupleScene<T>>, inputs: _SceneInputs) -> _SceneOutputs {
        let mirror = Mirror(reflecting: scene.value.value)
        var outputs = _SceneOutputs()
        outputs.type = Self.self
        outputs.scene = scene.value

        for child in mirror.children {
            guard let childScene = child.value as? any Scene else {
                continue
            }

            func build<V>(_ scene: V, inputs: _SceneInputs) -> _SceneOutputs where V : Scene {
                V._makeScene(scene: _GraphValue(scene), inputs: inputs)
            }

            let output = build(childScene, inputs: inputs)
            outputs.children.append(output)
        }

        return outputs
    }
}