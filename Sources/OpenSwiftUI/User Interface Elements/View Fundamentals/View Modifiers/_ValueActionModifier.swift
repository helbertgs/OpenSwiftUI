import Swift

@frozen public struct _ValueActionModifier<Value> : ViewModifier where Value : Equatable {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var value: Value
    public var action: (Value) -> Void

    // MARK: - Constructor(s).

    @inlinable public init(value: Value, action: @escaping (Value) -> Void) {
        (self.value, self.action) = (value, action)
    }

    // MARK: - Static Function(s).

//    public static func _makeView(modifier: _GraphValue<_ValueActionModifier<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
//    public static func _makeViewList(modifier: _GraphValue<_ValueActionModifier<Value>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs
}

extension _ValueActionModifier : _SceneModifier {
    public static func _makeScene(modifier: _GraphValue<_ValueActionModifier<Value>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        fatalError()
    }
}
