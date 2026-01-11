import Foundation

/// Abstraction to render a `ViewGraph` into a native window.
///
/// This intentionally sits in the "runtime layer" (not in outputs). The output layer
/// (`_ViewOutputs`) is pure, and the renderer consumes it to produce GPU commands.
package protocol ViewRendering {
    @MainActor func render(viewGraph: ViewGraph, in window: _Window)
}

/// Minimal renderer stub.
///
/// - Note: This is the place to bridge `_ViewOutputs` -> layout -> draw list -> OpenGL.
package struct ViewRenderer: ViewRendering {
    @MainActor package init() {}

    @MainActor package func render(viewGraph: ViewGraph, in window: _Window) {
        // Make context current before issuing GL calls.
        window.makeContextCurrent()

        // TODO: Convert `viewGraph.outputs` into render commands.
        // For now this is a placeholder to validate the graph/render loop wiring.
        _ = viewGraph.outputs
    }
}
