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
    private(set) var data: _SceneOutputs

    // MARK: - Window Associated objects

    /// Runtime window for renderable scenes (e.g. `Window`).
    private(set) var window: NSWindow?

    /// Whether this scene is the main scene.
    var isMain: Bool = false

    /// The runtime view graph for this scene's root view.
    private(set) var viewGraph: ViewGraph? = nil

    /// Returns all view graphs managed by this scene graph.
    var viewGraphs: [ViewGraph] {
        children.compactMap { $0 as? ViewGraph }
    }

    // MARK: - Initialization

    /// Creates a scene graph with the given data.
    ///
    /// - Parameter data: The data of the scene.
    init(data: _SceneOutputs) {
        self.data = data
        super.init()
    }

    // MARK: - Runtime lifecycle

    override func mount() {
        guard !isMounted else { return }
        
        // Create the window
        let window = NSWindow(frame: .init(origin: data.position, size: data.size))
        window.id = data.id
        window.delegate = self
        window.title = data.title

        if let rootView = data.content?.view {
            window.contentView = NSHostingView(rootView: AnyView(rootView))
        } else {
            window.contentView = NSView(frame: .init(origin: Point3D.zero, size: .init(width: 900, height: 450)))
        }

        window.contentView?.window = window
        window.contentView?.frame = window.frame

        // Register with the application
        Application.shared.registerWindow(window)
        
        self.window = window

        data.environmentValues.windowSize = window.frame.size
        data.environmentValues.scenePhase = .active

        if let windowPlacement = data.environmentValues.defaultSceneWindowPlacement?(
            WindowLayoutRoot(), 
            WindowPlacementContext(
                defaultDisplay: DisplayProxy(bounds: window.frame, safeAreaInsets: .init(), visibleRect: window.frame), 
                windows: [
                    WindowProxy(id: window.id, phase: data.environmentValues.scenePhase)
                ]
            )
        ) {
            print(windowPlacement)   
        }

        // Show the main window
        if isMain {
            data.environmentValues.openWindow(id: data.id)
        }

        reconcileViewGraphs(with: data.content)
        
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

    override func clear() {
        guard isMounted else { return }
        window?.clear()
        super.clear()
    }

    // MARK: - Scene Data Updates

    /// Updates the scene data and applies changes to the window.
    ///
    /// - Parameter newData: The new scene data.
    func updateData(_ newData: _SceneOutputs) {
        let oldData = data
        data = newData
        
        // Apply changes to window if needed
        if let window = window {
            if oldData.title != newData.title {
                window.title = newData.title
            }

            let oldFrame = Rect3D(origin: oldData.position, size: oldData.size)
            let newFrame = Rect3D(origin: newData.position, size: newData.size)
            if oldFrame != newFrame {
                window.frame = newFrame
                data.environmentValues.windowSize = window.frame.size
            }
            // Add more property updates as needed
        }
        
        reconcileViewGraphs(with: data.content)
    }

    // MARK: - View Graph Management

    /// Creates view graphs from the scene outputs.
    ///
    /// - Parameter outputs: The scene outputs to create graphs from.
    private func reconcileViewGraphs(with outputs: _ViewOutputs?) {
        let newViewOutputs = outputs.map { $0.children.isEmpty ? [$0] : $0.children } ?? []
        let existingViewGraphs = viewGraphs

        let sharedCount = min(existingViewGraphs.count, newViewOutputs.count)

        if sharedCount > 0 {
            for index in 0..<sharedCount {
                existingViewGraphs[index].updateOutputs(newViewOutputs[index])
            }
        }

        if newViewOutputs.count > existingViewGraphs.count {
            for index in existingViewGraphs.count..<newViewOutputs.count {
                let graph = ViewGraph(outputs: newViewOutputs[index])
                insertChild(graph, at: index)
                if isMounted {
                    graph.mount()
                }
            }
        } else if existingViewGraphs.count > newViewOutputs.count {
            for index in stride(from: existingViewGraphs.count - 1, through: newViewOutputs.count, by: -1) {
                let graph = existingViewGraphs[index]
                graph.unmount()
                removeChild(graph)
            }
        }

        viewGraph = viewGraphs.first
    }

    private func reconcileSceneContentForEnvironmentChange() {
        guard let scene = data.scene else {
            viewGraphs.forEach { $0.markDirty() }
            return
        }

        var inputs = _SceneInputs()
        inputs.environmentValues = data.environmentValues

        var rebuiltOutputs = makeScene(scene, inputs: inputs)
        rebuiltOutputs.size = data.size
        rebuiltOutputs.position = data.position
        data = rebuiltOutputs

        reconcileViewGraphs(with: rebuiltOutputs.content)
    }

    private func makeScene<S>(_ scene: S, inputs: _SceneInputs) -> _SceneOutputs where S: Scene {
        S._makeScene(scene: .init(scene), inputs: inputs)
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
        reconcileSceneContentForEnvironmentChange()
    }

    /// Tells the delegate that the window has been deminimized.
    package func windowDidDeminiaturize(_ window: NSWindow) {
        data.environmentValues.scenePhase = .active
        reconcileSceneContentForEnvironmentChange()
    }

    /// Tells the delegate that the window has been resized.
    package func windowDidResize(_ window: NSWindow, to size: Size3D) {
        // Update data with new size
        data.size = size
        data.environmentValues.windowSize = size
        
        reconcileSceneContentForEnvironmentChange()
    }

    /// Tells the delegate that the window has been loaded.
    package func windowLoaded(_ window: NSWindow) {
        // Window is ready for rendering
        data.environmentValues.scenePhase = .active
        data.environmentValues.windowSize = window.frame.size
        reconcileSceneContentForEnvironmentChange()
    }
}
