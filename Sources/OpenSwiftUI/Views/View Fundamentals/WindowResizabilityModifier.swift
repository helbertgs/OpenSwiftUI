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

    public static func _makeScene(modifier: _GraphValue<WindowResizabilityModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        var outputs = _SceneOutputs()
        outputs.type = Self.self
        outputs.modifiers = inputs.modifiers
        outputs.modifiers.append(modifier.value)

        return outputs
    }
}
