import Swift

@frozen public struct _EnvironmentKeyWritingModifier<Value>: ViewModifier {

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
