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
@MainActor
class AppGraph<AppType: App> : GraphHost {

    /// The app instance.
    let app: AppType

    /// The environment values for the app.
    let environmentValues: EnvironmentValues

    // /// The root scene graph for the app (built from `app.body`).
    // package private(set) var sceneGraph: SceneGraph? = nil

    /// Creates an app graph with the given value.
    ///
    /// - Parameter value: The value of the app graph.
    init(_ app: AppType, environmentValues: EnvironmentValues) {
        self.app = app
        self.environmentValues = environmentValues
        super.init()

        self.mount()
    }

    override func mount() {
        var inputs = _SceneInputs()
        inputs.environmentValues = environmentValues

        let outputs =  AppType.Body._makeScene(scene: .init(app.body), inputs: inputs)
        if outputs.children.count > 0 {
            outputs
                .children
                .enumerated()
                .forEach { index, value in
                    let child = SceneGraph(data: value)
                    child.isMain = index == 0
                    self.children.append(child)
                }
            }
        else { 
            let child = SceneGraph(data: outputs)
            child.isMain = true
            self.children.append(child)
        }

        self.children
            .first(where: { window in
                (window as? SceneGraph)?.isMain == true
            })?
            .mount()
    }
}
