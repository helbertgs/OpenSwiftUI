import Foundation

@frozen
public struct _ValueActionModifier2<V> : _SceneModifier {
    
    // MARK: - Property(ies).
    
    public let value: V
    public let action: (V, V) -> Void
    
    // MARK: - Constructor(s).
    
    public init(value: V, action: @escaping (V, V) -> Void) {
        self.value = value
        self.action = action
    }
    
    public init(value: V, action: @escaping () -> Void) {
        self.value = value
        self.action = {_, _ in action() }
    }
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> some Scene {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<_ValueActionModifier2<V>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        .init(props: [
            "actionModifier": (value: modifier.value.value, action: modifier.value.action)
        ])
    }
}
