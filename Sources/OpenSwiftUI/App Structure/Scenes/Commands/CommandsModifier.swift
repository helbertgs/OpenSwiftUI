import Swift

public struct CommandsModifier<Content> : _SceneModifier where Content : Commands {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    var content: Content

    // MARK: - Constructor(s).

    init(content: Content) {
        self.content = content
    }

    // MARK: - Static Function(s).

    public static func _makeScene(modifier: _GraphValue<CommandsModifier<Content>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        fatalError()
    }
}
