import Foundation

/// A type-erased storage for accumulated preference values.
public struct PreferenceValues {
    private var storage: [ObjectIdentifier: Any] = [:]

    public init() {}

    public subscript<Key: PreferenceKey>(_ key: Key.Type) -> Key.Value {
        get {
            storage[ObjectIdentifier(key)] as? Key.Value ?? key.defaultValue
        }
        set {
            storage[ObjectIdentifier(key)] = newValue
        }
    }
}
