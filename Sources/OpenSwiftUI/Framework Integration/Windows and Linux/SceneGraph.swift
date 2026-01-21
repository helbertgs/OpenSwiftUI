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
///
/// `SceneGraph` manages the lifecycle of a scene, including its associated window
/// and view graph. It acts as the delegate for window events and propagates
/// state changes to its children.
@MainActor 
class SceneGraph : GraphHost {

    // MARK: - Represented object

    /// The scene data snapshot for this node.
    private(set) var data: _SceneData

    // MARK: - Window Associated objects

    /// Runtime window for renderable scenes (e.g. `Window`).
    private(set) var window: NSWindow?

    /// Whether this scene is the main scene.
    var isMain: Bool = false

    /// The runtime view graph for this scene's root view.
    private(set) var viewGraph: ViewGraph? = nil

    // MARK: - Initialization

    /// Creates a scene graph with the given data.
    ///
    /// - Parameter data: The data of the scene.
    init(data: _SceneData) {
        self.data = data
        super.init()
    }

    // MARK: - Runtime lifecycle

    override func mount() {
        guard !isMounted else { return }
        
        // Create the window
        let window = NSWindow(frame: .init(origin: data.position, size: data.size))
        window.delegate = self
        window.title = data.title

        // Register with the application
        Application.shared.registerWindow(window)
        
        self.window = window

        // Show the main window
        if isMain {
            data.environmentValues.openWindow(id: window.id)
        }

        createViewGraphs(from: data.content)
        
        // Mark as mounted and mount children
        super.mount()
    }

    override func unmount() {
        guard isMounted else { return }
        
        // Unmount children first (ViewGraphs)
        super.unmount()
        
        // Clean up view graph
        viewGraph?.unmount()
        viewGraph = nil
        
        // Unregister and clean up window
        if let window = window {
            window.delegate = nil
            Application.shared.unregisterWindow(window)
        }
        window = nil
    }

    override func processEvents() {
        guard isMounted else { return }
        window?.pollEvents()
        super.processEvents()
    }

    override func render() {
        guard isMounted else { return }
        window?.display()
        super.render()
    }

    override func swapBuffers() {
        guard isMounted else { return }
        window?.swapBuffers()
        super.swapBuffers()
    }

    override func update() {
        guard isMounted else { return }
        window?.update()
        super.update()
    }

    // MARK: - Scene Data Updates

    /// Updates the scene data and applies changes to the window.
    ///
    /// - Parameter newData: The new scene data.
    func updateData(_ newData: _SceneData) {
        let oldData = data
        data = newData
        
        // Apply changes to window if needed
        if let window = window {
            if oldData.title != newData.title {
                window.title = newData.title
            }
            // Add more property updates as needed
        }
        
        // Mark view graph as dirty if needed
        viewGraph?.markDirty()
    }

    // MARK: - View Graph Management

    /// Creates view graphs from the scene outputs.
    ///
    /// - Parameter outputs: The scene outputs to create graphs from.
    private func createViewGraphs(from outputs: _ViewOutputs?) {
        guard let outputs = outputs else { return }
        let viewDatas = outputs.children.isEmpty ? [outputs] : outputs.children
        
        for (index, data) in viewDatas.enumerated() {
            let viewGraph = ViewGraph(outputs: data)
            insertChild(viewGraph, at: index)
        }
    }
}

// MARK: - CustomStringConvertible

extension SceneGraph : @MainActor CustomStringConvertible {
    package var description: String {
        """
        SceneGraph<\(data.type)> {
            id: \(data.id)
            isMain: \(isMain)
            isMounted: \(isMounted)
            children: \(children.count)
            window: \(window != nil ? "present" : "nil")
        }
        """
    }
}

// MARK: - NSWindowDelegate

extension SceneGraph : @MainActor NSWindowDelegate {

    /// Tells the delegate that the window is about to be minimized.
    package func windowWillMiniaturize(_ window: NSWindow) {
        // Prepare for minimization if needed
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
        // Update data with new size
        data.size = size
        
        // Mark view graph as dirty to trigger re-layout
        viewGraph?.markDirty()
    }

    /// Tells the delegate that the window has been loaded.
    package func windowLoaded(_ window: NSWindow) {
        // Window is ready for rendering
        data.environmentValues.scenePhase = .active
    }
}
