import Swift

public struct WindowStyleModifier<Style> : Sendable, SceneModifier where Style : WindowStyle {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    package let style: Style

    // MARK: - Constructor(s).

    package init(style: Style) {
        self.style = style
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }

    // MARK: - Static Function(s).

    public static func _makeScene(modifier: _GraphValue<WindowStyleModifier<Style>>, inputs: _SceneInputs) -> _SceneOutputs {
        var outputs = inputs
        outputs.style = modifier.value.style

        return outputs
    }
}
