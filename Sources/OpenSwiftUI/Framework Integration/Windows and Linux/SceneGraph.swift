import Foundation
import OpenCombine

/// A graph host for a scene.
package final class SceneGraph : GraphHost {

    // MARK: - Represented object

    /// The scene outputs snapshot for this node.
    package private(set) var outputs: _SceneOutputs

    // MARK : - Window Associated objects

    /// Runtime window for renderable scenes (e.g. `Window`).
    @MainActor package private(set) var window: _Window? = nil

    // MARK: - Runtime Associated objects

    /// The environment values for the scene.
    package var environmentValues: EnvironmentValues = EnvironmentValues()

    /// Whether this scene is the main scene.
    package var isMain: Bool = false

    /// The title of the scene.
    package var title: PassthroughSubject<String, Never> = PassthroughSubject<String, Never>()

    /// The phase of the scene.
    package var scenePhase: PassthroughSubject<ScenePhase, Never> = PassthroughSubject<ScenePhase, Never>()

    /// The runtime subscriptions for this node.
    private var cancellables: Set<AnyCancellable> = []

    /// The runtime view graph for this scene's root view.
    @MainActor package private(set) var viewGraph: ViewGraph? = nil

    /// Creates a scene graph with the given outputs.
    ///
    /// - Parameter outputs: The outputs of the scene.
    package init(outputs: _SceneOutputs) {
        self.outputs = outputs
        self.environmentValues = outputs.environmentValues

        super.init()

        title.send(outputs.title)

        scenePhase.sink { [weak self] in 
            self?.environmentValues.scenePhase = $0
        }
        .store(in: &cancellables)

        // Build child scene graphs.
        for child in outputs.children {
            appendChild(SceneGraph(outputs: child))
        }
    }

    // MARK: - Runtime lifecycle

    /// Creates runtime objects for this scene node and its descendants.
    @MainActor package func mountRuntime() {
        if let content = outputs.content {
            // Create window from scene outputs (runtime lives in the graph, not in outputs).
            let title = outputs.title ?? String(describing: outputs.type)
            let win = _Window(frame: .init(center: .zero, size: outputs.size), title: title)
            self.window = win

            // Keep a view graph for the root content.
            self.viewGraph = ViewGraph(outputs: content)

            // When the window changes (e.g. resize), mark views dirty.
            win.size
                .sink { [weak self] _ in
                    self?.viewGraph?.markDirty()
                }
                .store(in: &cancellables)

            // Create the native window (GLFW) but do not block; the loop is managed by WindowManager.
            win.loadIfNeeded()
            win.show()
        }

        for child in children {
            (child as? SceneGraph)?.mountRuntime()
        }
    }

    @MainActor package func unmountRuntime() {
        cancellables.removeAll()
        if let w = window {
            w.destroy()
        }
        window = nil
        viewGraph = nil

        for child in children {
            (child as? SceneGraph)?.unmountRuntime()
        }
    }

    // MARK: - Reconciliation

    /// Reconciles this node with a new `_SceneOutputs` snapshot.
    ///
    /// Identity is based on `outputs.id`. For nodes without stable IDs, this will recreate.
    @MainActor package func reconcile(newOutputs: _SceneOutputs) {
        let oldHadWindow = (outputs.content != nil)
        let newHasWindow = (newOutputs.content != nil)

        // Update snapshot first.
        outputs = newOutputs

        // Window lifecycle / updates.
        switch (oldHadWindow, newHasWindow) {
        case (false, false):
            break
        case (false, true):
            // Newly became renderable.
            mountRuntime()
        case (true, false):
            // No longer renderable.
            unmountRuntime()
        case (true, true):
            // Update window properties (title/size) and view outputs.
            if let w = window {
                let title = newOutputs.title ?? String(describing: newOutputs.type)
                w.title = title
                w.frame = .init(center: .zero, size: newOutputs.size)
            }
            if let content = newOutputs.content {
                if let vg = viewGraph {
                    vg.updateOutputs(content)
                } else {
                    viewGraph = ViewGraph(outputs: content)
                }
            }
        }

        // Reconcile children by id (stable for `Window`).
        let existingChildren: [SceneGraph] = children.compactMap { $0 as? SceneGraph }
        var byID: [String: SceneGraph] = [:]
        for child in existingChildren {
            byID[child.outputs.id] = child
        }

        var newChildren: [GraphHost] = []
        var usedIDs: Set<String> = []

        for childOutputs in newOutputs.children {
            if let existing = byID[childOutputs.id] {
                existing.reconcile(newOutputs: childOutputs)
                newChildren.append(existing)
                usedIDs.insert(childOutputs.id)
            } else {
                let created = SceneGraph(outputs: childOutputs)
                created.mountRuntime()
                newChildren.append(created)
                usedIDs.insert(childOutputs.id)
            }
        }

        // Unmount children that disappeared.
        for oldChild in existingChildren where !usedIDs.contains(oldChild.outputs.id) {
            oldChild.unmountRuntime()
        }

        // Replace children list.
        self.children = newChildren
        for child in newChildren {
            child.parent = self
        }
    }

    // MARK: - Queries

    @MainActor package func firstWindow() -> _Window? {
        if let w = window { return w }
        for child in children {
            if let w = (child as? SceneGraph)?.firstWindow() { return w }
        }
        return nil
    }

    @MainActor package func collectWindowScenes(into result: inout [SceneGraph]) {
        if window != nil {
            result.append(self)
        }
        for child in children {
            (child as? SceneGraph)?.collectWindowScenes(into: &result)
        }
    }
}

extension SceneGraph : CustomStringConvertible {
    package var description: String {
        """
        - SceneGraph<outputs: \(outputs.type)>
            - isMain: \(isMain)
            - children: \(children.count)
        """
    }
}