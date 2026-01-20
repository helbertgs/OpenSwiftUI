import Swift

@frozen public struct _EnvironmentKeyTransformModifier<V> : @MainActor SceneModifier {

    // MARK: - Property(ies).
    
    @usableFromInline
    let keyPath: WritableKeyPath<EnvironmentValues, V>
    
    @usableFromInline
    let transform: (inout V) -> Void
    
    // MARK: - Constructor(s).
    
    @inlinable 
    public init(keyPath: WritableKeyPath<EnvironmentValues, V>, transform: @escaping (inout V) -> Void) {
        self.keyPath = keyPath
        self.transform = transform
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> some Scene {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<_EnvironmentKeyTransformModifier>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError("not implemented yet")
    }
}
