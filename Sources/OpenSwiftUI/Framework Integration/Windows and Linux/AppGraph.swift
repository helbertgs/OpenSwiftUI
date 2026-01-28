//
// AppGraph.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 19, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation
import OpenCombine
import OpenSpatial

/// A graph host for an app.
///
/// `AppGraph` is the root of the runtime graph hierarchy. It manages the app's
/// scenes and coordinates the lifecycle of the entire application graph.
@MainActor
class AppGraph<AppType: App> : GraphHost {

    // MARK: - Properties

    /// The app instance.
    let app: AppType

    /// The environment values for the app.
    let environmentValues: EnvironmentValues

    // MARK: - Computed Properties

    /// Returns all scene graphs managed by this app graph.
    var sceneGraphs: [SceneGraph] {
        children.compactMap { $0 as? SceneGraph }
    }

    /// Returns the main scene graph, if any.
    var mainSceneGraph: SceneGraph? {
        sceneGraphs.first { $0.isMain }
    }

    // MARK: - Initialization

    /// Creates an app graph with the given app and environment values.
    ///
    /// - Parameters:
    ///   - app: The app instance.
    ///   - environmentValues: The environment values for the app.
    init(_ app: AppType, environmentValues: EnvironmentValues) {
        self.app = app
        self.environmentValues = environmentValues
        super.init()

        self.mount()
    }

    // MARK: - Lifecycle

    override func mount() {
        guard !isMounted else { return }
        
        // Build scene inputs
        var inputs = _SceneInputs()
        inputs.environmentValues = environmentValues

        // Build scene outputs from the app body
        let outputs = AppType.Body._makeScene(scene: .init(app.body), inputs: inputs)
        
        // Create scene graphs from outputs
        createSceneGraphs(from: outputs)
        
        // Mount the main scene first
        mainSceneGraph?.mount()
        
        super.mount()
    }

    override func unmount() {
        guard isMounted else { return }
        
        // Unmount all scene graphs
        super.unmount()
        
        // Remove all children
        removeAllChildren()
    }

    // MARK: - Scene Management

    /// Creates scene graphs from the scene outputs.
    ///
    /// - Parameter outputs: The scene outputs to create graphs from.
    private func createSceneGraphs(from outputs: _SceneOutputs) {
        let sceneDatas = outputs.children.isEmpty ? [outputs] : outputs.children
        
        for (index, data) in sceneDatas.enumerated() {
            let sceneGraph = SceneGraph(data: data)
            sceneGraph.isMain = (index == 0)
            appendChild(sceneGraph)
        }
    }

    /// Finds a scene graph by its identifier.
    ///
    /// - Parameter id: The identifier of the scene.
    /// - Returns: The scene graph with the matching identifier, or `nil` if not found.
    func sceneGraph(withId id: String) -> SceneGraph? {
        sceneGraphs.first { $0.data.id == id }
    }

    /// Mounts a scene graph with the specified identifier.
    ///
    /// - Parameter id: The identifier of the scene to mount.
    func mountScene(withId id: String) {
        sceneGraph(withId: id)?.mount()
    }

    /// Unmounts a scene graph with the specified identifier.
    ///
    /// - Parameter id: The identifier of the scene to unmount.
    func unmountScene(withId id: String) {
        sceneGraph(withId: id)?.unmount()
    }
}

// MARK: - CustomStringConvertible

extension AppGraph: @MainActor CustomStringConvertible {
    nonisolated var description: String {
        """
        AppGraph<\(AppType.self)>
        """
    }
}
