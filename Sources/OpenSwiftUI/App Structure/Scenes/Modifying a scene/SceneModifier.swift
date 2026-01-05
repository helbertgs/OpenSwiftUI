//
// SceneModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// A modifier that you apply to a scene or another scene modifier, producing a different version of the original
@available(Windows 11, *)
@MainActor @preconcurrency public protocol SceneModifier {

    // MARK: - Associated Type(s).

    /// The type of scene representing the body.
    associatedtype Body : Scene

    // MARK: - Type Alias.

    /// The content view type passed to `body()`.
    typealias Content = SceneModifier_Content<Self>

    // MARK: - Property(ies).

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    @SceneBuilder func body(content: Self.Content) -> Self.Body

    // MARK: - Static Function(s).

    /// Creates the scene's modifier representation in the OpenSwiftUI scene graph.
    /// 
    /// - Parameters:
    ///   - scene: The modifier to create.
    ///   - inputs: The inputs for the scene.
    static func _makeScene(modifier: _GraphValue<Self>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs
}

extension SceneModifier {
    
    /// Returns a new modifier that is the result of concatenating self with modifier.
    nonisolated package func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(content: self, modifier: modifier)
    }
}
