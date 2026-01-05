import Swift

public struct _SceneInputs {

    /// The scene that this input represents.
    var scene: (any Scene)? = nil

    /// The environment values for the scene.
    var environmentValues: EnvironmentValues = .init()

    /// The modifiers applied to the scene.
    var modifiers: [any SceneModifier] = []

    /// The content of the scene, if any.
    var content: (any View)? = nil
}
