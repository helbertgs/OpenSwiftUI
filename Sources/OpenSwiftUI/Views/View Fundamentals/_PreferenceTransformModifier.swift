import Swift

@frozen
public struct _PreferenceTransformModifier<Key> : @MainActor SceneModifier {
    
    // MARK: - Type Alias.
    
    public typealias Body = Never
    
    // MARK: - Property(ies).
    
    public var key: Key
    
    // MARK: - Constructor(s).
    
    @inlinable public init(key: Key) {
        self.key = key
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<_PreferenceTransformModifier<Key>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        var outputs = _SceneOutputs()
        outputs.type = Self.self
        outputs.modifiers = inputs.modifiers
        outputs.modifiers.append(modifier.value)

        return outputs
    }
}
