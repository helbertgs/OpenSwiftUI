import Swift

public struct _ViewInputs {

    /// The environment values for the view.
    var environmentValues: EnvironmentValues = .init()

    /// The modifiers applied to the view.
    var modifiers: [any SceneModifier] = []

    /// The content of the scene, if any.
    var content: (any View)? = nil
}
