import Swift

public struct _SceneModifier_Content<Modifier> : Scene where Modifier : _SceneModifier {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never {
        fatalError()
    }

    // MARK: - Static Function(s).

    public static func _makeScene(scene: _GraphValue<_SceneModifier_Content<Modifier>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError()
    }
}
