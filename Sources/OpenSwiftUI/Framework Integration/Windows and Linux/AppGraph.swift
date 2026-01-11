import Foundation
import OpenCombine
import OpenSpatial

/// A graph host for an app.
package final class AppGraph<AppType: App> : GraphHost {

    /// The app instance.
    package let app: AppType

    /// The environment values for the app.
    package var environmentValues: EnvironmentValues

    // /// The root scene graph for the app (built from `app.body`).
    // package private(set) var sceneGraph: SceneGraph? = nil

    /// Creates an app graph with the given value.
    ///
    /// - Parameter value: The value of the app graph.
    package init(_ app: AppType, environmentValues: EnvironmentValues) {
        self.app = app
        self.environmentValues = environmentValues
        super.init()

        self.mount()
    }

    override package func mount() {
        var inputs = _SceneInputs()
        inputs.environmentValues = environmentValues
        
        let outputs =  AppType.Body._makeScene(scene: .init(app.body), inputs: inputs)
        if outputs.children.count > 0 {
            outputs
                .children
                .enumerated()
                .forEach { index, value in
                    let child = SceneGraph(outputs: value)
                    child.isMain = index == 0
                    self.children.append(child)
                }
            }
        else { 
            let child = SceneGraph(outputs: outputs)
            child.isMain = true
            self.children.append(child)
        }

        print("\(Self.self)")
        self.children
            .forEach { print("\($0)") }
    }
}