import OpenSpatial

/// The outputs of a scene.
public struct _SceneOutputs {

    // MARK: - Checking characteristics

    /// The type of the scene.
    var type: Any.Type? = nil

    /// The scene that this output represents.
    var scene: (any Scene)? = nil

    /// The environment values for the scene.
    var environmentValues: EnvironmentValues = .init()

    /// The modifiers applied to the scene.
    var modifiers: [any SceneModifier] = []

    /// The child scenes of this scene output.
    var children: [_SceneOutputs] = []

    /// The content view of the scene, if applicable.
    var content: _ViewOutputs? = nil

    /// The title of the scene.
    var title: String? = nil

    /// The size of the scene.
    var size: Size3D = .one

    /// The position of the scene.
    var position: UnitPoint = .center

    /// The graphics context to render the scene into.
    var graphicsContext: GraphicsContext?

    // MARK: - Rendering the scene

    /// Renders the scene into the given context.
    ///
    /// - Parameter context: The context to render the scene into.
    mutating func render() {
        if graphicsContext == nil {
            graphicsContext = GraphicsContext()
        }
    }
}
