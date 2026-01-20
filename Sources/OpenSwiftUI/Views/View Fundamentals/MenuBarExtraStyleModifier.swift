import Swift

@frozen
public struct MenuBarExtraStyleModifier<Style> : @MainActor SceneModifier where Style : MenuBarExtraStyle {
    
    // MARK: - Property(ies).
    
    public let style: Style
    
    // MARK: - Constructor(s).
    
    @inlinable
    public init(style: Style) {
        self.style = style
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> some Scene {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<MenuBarExtraStyleModifier<Style>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError("not implemented yet")
    }
}
