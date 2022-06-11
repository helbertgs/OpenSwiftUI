import Swift

public struct _GraphValue<Value>  {

    // MARK: - Property(ies).
    internal var value: Value

    // MARK: - Constructor(s).
    init(_ value: Value) {
        self.value = value
    }

    // MARK: - Subscript(s).
    public subscript<T>(keyPath: KeyPath<Value, T>) -> _GraphValue<T> {
        .init(value[keyPath: keyPath])
    }
}

extension _GraphValue : Equatable where Value : Equatable {
    // MARK: - Equatable
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: _GraphValue<Value>, rhs: _GraphValue<Value>) -> Bool {
        lhs.value == rhs.value
    }
}
