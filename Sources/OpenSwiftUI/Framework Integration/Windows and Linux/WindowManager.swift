import Foundation

/// Central event/render loop for native windows.
///
/// This is where you avoid calling `_Window.runLoop()` per window (which would block),
/// and instead keep a single loop that:
/// - polls GLFW events once per tick
/// - renders dirty view graphs
/// - swaps buffers per window
@MainActor package final class WindowManager {

    package static let shared = WindowManager()

    package var renderer: any ViewRendering

    private init(renderer: any ViewRendering = ViewRenderer()) {
        self.renderer = renderer
    }

    /// Runs until all windows are closed.
    @MainActor package func run(root: SceneGraph) {
        // Ensure runtime objects exist before starting the loop.
        root.mountRuntime()

        mainLoop(root: root)
    }

    @MainActor private func mainLoop(root: SceneGraph) {
        while true {
            var windowScenes: [SceneGraph] = []
            root.collectWindowScenes(into: &windowScenes)

            if windowScenes.isEmpty { break }

            // Global poll for all windows (GLFW).
            _Window.pollEvents()

            for scene in windowScenes {
                guard let window = scene.window else { continue }

                if window.isShouldClose {
                    scene.unmountRuntime()
                    continue
                }

                // Render only when dirty.
                if let viewGraph = scene.viewGraph, viewGraph.isDirty {
                    renderer.render(viewGraph: viewGraph, in: window)
                    viewGraph.clearDirty()
                }

                // Present.
                window.swapBuffers()
            }
        }
    }
}

