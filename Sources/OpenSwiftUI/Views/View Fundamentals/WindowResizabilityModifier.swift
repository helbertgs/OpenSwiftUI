import Swift

@frozen
public struct WindowResizabilityModifier : _SceneModifier {
    
    // MARK: - Property(ies).
    
    public let resizability: WindowResizability
    
    // MARK: - Constructor(s).
    
    @inlinable
    public init(resizability: WindowResizability) {
        self.resizability = resizability
    }
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> some Scene {
        fatalError()
    }

    public static func _makeScene(modifier: _GraphValue<WindowResizabilityModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        .init(props: ["windowResizability" : modifier.value.resizability])
    }    
}
