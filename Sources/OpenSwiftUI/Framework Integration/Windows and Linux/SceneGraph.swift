//
// SceneGraph.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 19, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation
import OpenCombine
import OpenSpatial

/// A graph host for a scene.
@MainActor 
class SceneGraph : GraphHost {

    // MARK: - Represented object

    /// The scene data snapshot for this node.
    private(set) var data: _SceneData

    // MARK : - Window Associated objects

    /// Runtime window for renderable scenes (e.g. `Window`).
    private(set) weak var window: NSWindow?

    /// Whether this scene is the main scene.
    var isMain: Bool = false

    /// The runtime view graph for this scene's root view.
    private(set) var viewGraph: ViewGraph? = nil

    /// Creates a scene graph with the given data.
    ///
    /// - Parameter data: The data of the scene.
    init(data: _SceneData) {
        self.data = data

        super.init()
    }

    // MARK: - Runtime lifecycle

    override func mount() {
        let window = NSWindow(frame: .init(origin: data.position, size: data.size))
        window.delegate = self
        window.title = data.title

        Application
            .shared
            .windows
            .append(window)
        
        self.window = window

        if isMain {
            data.environmentValues.openWindow(id: window.id)
        }
    }

    override func processEvents() {
        window?.pollEvents()
    }

    override func render() {
        window?.display()
    }

    override func swapBuffers() {
        window?.swapBuffers()
    }

    override func update() {
        window?.update()
    }
}

extension SceneGraph : @MainActor CustomStringConvertible {
    package var description: String {
        """
        - SceneGraph<data: \(data.type)>
            - isMain: \(isMain)
            - children: \(children.count)
        """
    }
}

extension SceneGraph : @MainActor NSWindowDelegate {

    /// Tells the delegate that the window is about to be minimized.
    package func windowWillMiniaturize(_ window: NSWindow) {
    }

    /// Tells the delegate that the window has been minimized.
    package func windowDidMiniaturize(_ window: NSWindow) {
        data.environmentValues.scenePhase = .background
    }

    /// Tells the delegate that the window has been deminimized.
    package func windowDidDeminiaturize(_ window: NSWindow) {
        data.environmentValues.scenePhase = .active
    }

    /// Tells the delegate that the window has been resized.
    package func windowDidResize(_ window: NSWindow, to size: Size3D) {
        // viewGraph?.markDirty()
    }

    /// Tells the delegate that the window has been loaded.
    package func windowLoaded(_ window: NSWindow) {
    }
}
