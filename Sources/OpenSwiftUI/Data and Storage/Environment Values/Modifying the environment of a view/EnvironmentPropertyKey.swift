import Swift

class AnyEnvironmentPropertyKey { }

class EnvironmentPropertyKey<Key> : AnyEnvironmentPropertyKey, CustomStringConvertible where Key : EnvironmentKey {

    // MARK: - Property(ies).

    var value : Key.Value

    // MARK: - Constructor(s).

    init(_ value: Key.Value) {
        self.value = value
    }

    // MARK: - CustomStringConvertible

    var description: String {
        "\(Self.self) = \(value)"
    }
}
