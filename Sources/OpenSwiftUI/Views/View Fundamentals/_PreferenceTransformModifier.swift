import Swift

@frozen
public struct _PreferenceTransformModifier<Key> : _SceneModifier {
    
    // MARK: - Type Alias.
    
    public typealias Body = Never
    
    // MARK: - Property(ies).
    
    public var key: Key
    
    // MARK: - Constructor(s).
    
    @inlinable public init(key: Key) {
        self.key = key
    }
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> Never {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<_PreferenceTransformModifier<Key>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        .init(props: ["keyboardShortcut": modifier.value.key])
    }
}
