import Swift

@frozen public struct _SceneOutputs {

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
}
