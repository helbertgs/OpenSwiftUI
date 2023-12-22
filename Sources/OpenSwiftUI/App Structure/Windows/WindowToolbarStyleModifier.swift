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
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> Never {
        fatalError()
    }

    // MARK: - Static Function(s).

    public static func _makeScene(modifier: _GraphValue<WindowToolbarStyleModifier<Style>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        var output = _SceneOutputs()
        output.windowToolbarStyle = modifier.value.style
        
        return output
    }
}
