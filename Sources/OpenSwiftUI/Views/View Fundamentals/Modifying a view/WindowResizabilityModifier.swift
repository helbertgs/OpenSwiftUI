import Swift

@frozen
public struct WindowResizabilityModifier : @MainActor SceneModifier {

    // MARK: - Property(ies).
    
    public let resizability: WindowResizability
    
    // MARK: - Constructor(s).
    
    @inlinable
    public init(resizability: WindowResizability) {
        self.resizability = resizability
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> some Scene {
        fatalError()
    }

    public static func _makeScene(modifier: _GraphValue<WindowResizabilityModifier>, inputs: _SceneInputs) -> _SceneOutputs {
        var outputs = _SceneOutputs(inputs: inputs)
        outputs.resizability = modifier.value.resizability
        return outputs
    }
}
