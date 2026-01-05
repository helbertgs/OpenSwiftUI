//
// SceneBuilder.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// A result builder for composing a collection of scenes into a single composite scene.
@resultBuilder public struct SceneBuilder {

    /// Builds a scene from a single content.
    /// 
    /// - Parameter content: The content to build the scene from.
    /// - Returns: A scene built from the content.
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Scene {
        content
    }

    /// Builds a scene from multiple contents.
    ///
    /// - Parameter content: The contents to build the scene from.
    /// - Returns: A scene built from the contents.
    public static func buildBlock<each Content>(_ content: repeat each Content) -> _TupleScene<(repeat each Content)> where repeat each Content : Scene {
        .init((repeat each content))
    }
}
