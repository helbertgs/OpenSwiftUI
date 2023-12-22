import Swift

public struct WindowStyleModifier<Style> : _SceneModifier where Style : WindowStyle {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    var style: Style

    // MARK: - Constructor(s).

    init(style: Style) {
        self.style = style
    }
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> Never {
        fatalError()
    }

    // MARK: - Static Function(s).

    public static func _makeScene(modifier: _GraphValue<WindowStyleModifier<Style>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        var output = _SceneOutputs()
        output.windowStyle = modifier.value.style
        
        return output
    }
}
