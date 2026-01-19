import Foundation
import OpenCombine
import OpenSpatial

/// A graph host for a scene.
@MainActor 
class SceneGraph : GraphHost {

    // MARK: - Represented object

    /// The scene outputs snapshot for this node.
    private(set) var outputs: _SceneOutputs

    // MARK : - Window Associated objects

    /// Runtime window for renderable scenes (e.g. `Window`).
    private(set) var window: NSWindow? = nil

    // MARK: - Runtime Associated objects

    /// The environment values for the scene.
    var environmentValues: EnvironmentValues

    /// Whether this scene is the main scene.
    var isMain: Bool = false

    /// The title of the scene.
    var title: String = ""

    /// The phase of the scene.
    var scenePhase: ScenePhase = .inactive

    /// The runtime subscriptions for this node.
    var cancellables: Set<AnyCancellable> = []

    /// The runtime view graph for this scene's root view.
    private(set) var viewGraph: ViewGraph? = nil

    /// Creates a scene graph with the given outputs.
    ///
    /// - Parameter outputs: The outputs of the scene.
    init(outputs: _SceneOutputs) {
        self.outputs = outputs
        self.environmentValues = outputs.environmentValues
        super.init()

        // Build child scene graphs.
        for child in outputs.children {
            appendChild(SceneGraph(outputs: child))
        }
    }

    // MARK: - Runtime lifecycle

    override func mount() {
        let window = NSWindow(frame: .init(origin: Point3D.zero, size: Size3D(width: 900, height: 450)))
        window.delegate = self
        window.title = "OpenSwiftUI Application"
        
        if isMain {
            window.makeKeyAndOrderFront(self)
        }
    }

    /// Creates runtime objects for this scene node and its descendants.
    // func mountRuntime() {
    //     if let content = outputs.content {
    //         // Create window from scene outputs (runtime lives in the graph, not in outputs).
    //         let title = outputs.title
    //         let win = _Window(frame: .init(center: .zero, size: outputs.size), title: title)
    //         self.window = win

    //         // Keep a view graph for the root content.
    //         self.viewGraph = ViewGraph(outputs: content)

    //         // When the window changes (e.g. resize), mark views dirty.
    //         // win.size
    //         //     .sink { [weak self] _ in
    //         //         self?.viewGraph?.markDirty()
    //         //     }
    //         //     .store(in: &cancellables)

    //         // Create the native window (GLFW) but do not block; the loop is managed by WindowManager.
    //         win.loadIfNeeded()
    //         win.show()
    //     }

    //     for child in children {
    //         (child as? SceneGraph)?.mountRuntime()
    //     }
    // }

    // func unmountRuntime() {
    //     cancellables.removeAll()
    //     if let w = window {
    //         w.destroy()
    //     }
    //     window = nil
    //     viewGraph = nil

    //     for child in children {
    //         (child as? SceneGraph)?.unmountRuntime()
    //     }
    // }

    

    // MARK: - Reconciliation

    /// Reconciles this node with a new `_SceneOutputs` snapshot.
    ///
    /// Identity is based on `outputs.id`. For nodes without stable IDs, this will recreate.
    // func reconcile(newOutputs: _SceneOutputs) {
    //     let oldHadWindow = (outputs.content != nil)
    //     let newHasWindow = (newOutputs.content != nil)

    //     // Update snapshot first.
    //     outputs = newOutputs

    //     // Window lifecycle / updates.
    //     switch (oldHadWindow, newHasWindow) {
    //     case (false, false):
    //         break
    //     case (false, true):
    //         // Newly became renderable.
    //         mountRuntime()
    //     case (true, false):
    //         // No longer renderable.
    //         unmountRuntime()
    //     case (true, true):
    //         // Update window properties (title/size) and view outputs.
    //         if let w = window {
    //             let title = newOutputs.title
    //             w.title = title
    //             w.frame = .init(center: .zero, size: newOutputs.size)
    //         }
    //         if let content = newOutputs.content {
    //             if let vg = viewGraph {
    //                 vg.updateOutputs(content)
    //             } else {
    //                 viewGraph = ViewGraph(outputs: content)
    //             }
    //         }
    //     }

    //     // Reconcile children by id (stable for `Window`).
    //     let existingChildren: [SceneGraph] = children.compactMap { $0 as? SceneGraph }
    //     var byID: [String: SceneGraph] = [:]
    //     for child in existingChildren {
    //         byID[child.outputs.id] = child
    //     }

    //     var newChildren: [GraphHost] = []
    //     var usedIDs: Set<String> = []

    //     for childOutputs in newOutputs.children {
    //         if let existing = byID[childOutputs.id] {
    //             existing.reconcile(newOutputs: childOutputs)
    //             newChildren.append(existing)
    //             usedIDs.insert(childOutputs.id)
    //         } else {
    //             let created = SceneGraph(outputs: childOutputs)
    //             created.mountRuntime()
    //             newChildren.append(created)
    //             usedIDs.insert(childOutputs.id)
    //         }
    //     }

    //     // Unmount children that disappeared.
    //     for oldChild in existingChildren where !usedIDs.contains(oldChild.outputs.id) {
    //         oldChild.unmountRuntime()
    //     }

    //     // Replace children list.
    //     self.children = newChildren
    //     for child in newChildren {
    //         child.parent = self
    //     }
    // }

    // // MARK: - Queries

    // func firstWindow() -> _Window? {
    //     if let w = window { return w }
    //     for child in children {
    //         if let w = (child as? SceneGraph)?.firstWindow() { return w }
    //     }
    //     return nil
    // }

    // func collectWindowScenes(into result: inout [SceneGraph]) {
    //     if window != nil {
    //         result.append(self)
    //     }
    //     for child in children {
    //         (child as? SceneGraph)?.collectWindowScenes(into: &result)
    //     }
    // }
}

extension SceneGraph : @MainActor CustomStringConvertible {
    package var description: String {
        """
        - SceneGraph<outputs: \(outputs.type)>
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
        environmentValues.scenePhase = .background
    }

    /// Tells the delegate that the window has been deminimized.
    package func windowDidDeminiaturize(_ window: NSWindow) {
        environmentValues.scenePhase = .active
    }

    /// Tells the delegate that the window has been resized.
    package func windowDidResize(_ window: NSWindow, to size: Size3D) {
        // viewGraph?.markDirty()
    }

    /// Tells the delegate that the window has been loaded.
    package func windowLoaded(_ window: NSWindow) {
    }
}