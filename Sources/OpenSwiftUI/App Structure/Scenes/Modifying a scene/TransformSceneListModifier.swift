//
// TransformSceneListModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

public struct TransformSceneListModifier {

    public let transform: () -> Void

    public init(_ transform: @escaping () -> Void) {
        self.transform = transform
    }
}

extension TransformSceneListModifier : SceneModifier {

    public func body(content: Content) -> Never {
        fatalError()
    }

    public nonisolated static func _makeScene(modifier: _GraphValue<TransformSceneListModifier>, inputs: _SceneInputs) -> _SceneOutputs {
        modifier.value.transform()
        return inputs
    }
}