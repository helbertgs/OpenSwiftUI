import Swift

@frozen public struct _EnvironmentKeyWritingModifier<Value> {

    // MARK: - Type Alias.
    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    // MARK: - Property(ies).
    var keyPath: WritableKeyPath<EnvironmentValues, Value>

    // The value.
    var value: Value

    // MARK: - Constructor(s).
    public init(keyPath: WritableKeyPath<EnvironmentValues, Value>, value: Value) {
        self.keyPath = keyPath
        self.value = value
    }
}

extension _EnvironmentKeyWritingModifier : ViewModifier {
    public static func _makeViewList(modifier: _GraphValue<_EnvironmentKeyWritingModifier<Value>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        .init()
    }

    public static func _makeView(modifier: _GraphValue<_EnvironmentKeyWritingModifier<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        .init()
    }

    public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        nil
    }
}

extension _EnvironmentKeyWritingModifier : _SceneModifier {
    public static func _makeScene(modifier: _GraphValue<_EnvironmentKeyWritingModifier<Value>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        fatalError()
    }
}
