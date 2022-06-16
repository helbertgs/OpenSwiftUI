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

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, Windows 1, *)
extension _EnvironmentKeyWritingModifier : ViewModifier {

}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, Windows 1, *)
extension _EnvironmentKeyWritingModifier : _SceneModifier {
    public static func _makeScene(modifier: _GraphValue<_EnvironmentKeyWritingModifier<Value>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        fatalError()
    }
}
