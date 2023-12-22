import Swift

@frozen
public struct _AppearanceActionModifier : _SceneModifier {
    
    // MARK: - Property(ies).
    
    public let appear: (() -> Void)?
    public let disappear: (() -> Void)?
    
    // MARK: - Constructor(s).
    
    @inlinable
    public init(appear: (() -> Void)? = nil, disappear: (() -> Void)? = nil) {
        self.appear = appear
        self.disappear = disappear
    }
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> some Scene {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<_AppearanceActionModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        var output = _SceneOutputs()
        
        if let appear = modifier.value.appear {
            output.onAppear = appear
        }
        
        if let disappear = modifier.value.disappear {
            output.onDisappear = disappear
        }
        
        return output
    }
}
