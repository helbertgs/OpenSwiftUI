import Swift

public struct WindowToolbarStyleModifier<Style> : _SceneModifier where Style : WindowToolbarStyle {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    var style: Style

    // MARK: - Constructor(s).

    init(style: Style) {
        self.style = style
    }

    // MARK: - Static Function(s).

    public static func _makeScene(modifier: _GraphValue<WindowToolbarStyleModifier<Style>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        fatalError()
    }
}
