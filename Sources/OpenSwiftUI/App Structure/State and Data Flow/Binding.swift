import Swift

@frozen @propertyWrapper @dynamicMemberLookup public struct Binding<Value> {

    // MARK: - Private Property(ies).

    @usableFromInline var getter: () -> Value
    @usableFromInline var setter: (Value) -> Void

    // MARK: - Public Property(ies).

    /// The underlying value referenced by the binding variable.
    public var wrappedValue : Value {
        get { getter() }
        set { setter(newValue) }
    }

    /// A projection of the binding value that returns a binding.
    public var projectedValue: Binding<Value> {
        Binding(get: getter, set: setter)
    }

    // MARK: - Subscript(s).

    public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> {
        get { Binding<Subject>.constant(wrappedValue[keyPath: keyPath]) }
        set { wrappedValue[keyPath: keyPath] = newValue.wrappedValue }
    }

    // MARK: - Constructor(s).

    /// Creates a binding by projecting the base value to an unwrapped value.
    /// - Parameters:
    ///   - base: A value to project to an unwrapped value.
    public init?(_ base: Binding<Value?>) {
        guard let wrappedValue = base.wrappedValue else {
            return nil
        }

        getter = { wrappedValue }
        setter = base.setter
    }

    /// Creates a binding by projecting the base value to an optional value.
    /// - Parameters:
    ///   - base: A value to project to an optional value.
    public init<V>(_ base: Binding<V>) where Value == V? {
        fatalError("")
    }

    /// Creates a binding from the value of another binding.
    public init(projectedValue: Binding<Value>) {
        self = projectedValue
    }

    /// Creates a binding with closures that read and write the binding value.
    /// - Parameters:
    ///   - get: A closure that retrieves the binding value. The closure has no parameters, and returns a value.
    ///   - set: A closure that sets the binding value. The closure has the following parameter:
    ///          * newValue: The new value of the binding value.
    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void) {
        self.getter = get
        self.setter = set
    }

    // MARK: - Static Function(s).

    /// Creates a binding with an immutable value.
    /// - Parameters:
    ///   - value: An immutable value.
    public static func constant(_ value: Value) -> Binding<Value> {
        .init(
            get: { value },
            set: { _ in })
    }
}

extension Binding where Value == AnyHashable {
    /// Creates a binding by projecting the base value to a hashable value.
    /// - Parameters:
    ///   - base: A Hashable value to project to an AnyHashable value.
    public init<V>(_ base: Binding<V>) where Value == AnyHashable, V : Hashable {
        fatalError()
    }

}
