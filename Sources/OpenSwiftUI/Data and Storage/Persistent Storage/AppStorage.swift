import Swift
import Foundation

/// A property wrapper type that reflects a value from `UserDefaults` and
/// invalidates a view on a change in value in that user default.
@frozen @propertyWrapper public struct AppStorage<Value> {

    // MARK: - Private Property(ies).

    var getter: () -> Value
    var setter: (Value) -> Void

    // MARK: - Property(ies).

    public var wrappedValue: Value {
        get { getter() }
        set { setter(newValue) }
    }

    public var projectedValue: Binding<Value> {
        .init(get: getter, set: setter)
    }

    // MARK: - Constructor(s).

    /// Creates a property that can read and write to a string user default.
    /// - Parameters:
    ///   - wrappedValue: A value to project to an unwrapped value.
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = UserDefaults.standard) where Value == String {
        getter = { store?.string(forKey: key) ?? wrappedValue }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write to an integer user default.
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = UserDefaults.standard) where Value == Int {
        getter = { store?.integer(forKey: key) ?? wrappedValue }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write to a user default as data.
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = UserDefaults.standard) where Value == Data {
        getter = { store?.data(forKey: key) ?? wrappedValue }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write to a string user default, transforming that to RawRepresentable data type.
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = UserDefaults.standard) where Value : RawRepresentable, Value.RawValue == String {
        getter = {
            guard let value = store?.string(forKey: key) as? Value else { return wrappedValue }
            return value
        }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write to a url user default.
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = UserDefaults.standard) where Value == URL {
        getter = {
            guard let value = store?.object(forKey: key) as? URL else { return wrappedValue }
            return value
        }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write to a double user default.
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = UserDefaults.standard) where Value == Double {
        getter = { store?.double(forKey: key) ?? wrappedValue }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write to a boolean user default.
    /// - Parameters:
    ///   - wrappedValue: The default value if an integer value is not specified for the given key.
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(wrappedValue: Value, _ key: String, store: UserDefaults? = UserDefaults.standard) where Value == Bool {
        getter = { store?.bool(forKey: key) ?? wrappedValue }
        setter = { store?.set($0, forKey: key) }
    }
}

extension AppStorage where Value : ExpressibleByNilLiteral {
    /// Creates a property that can read and write an Optional integer user default.
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = UserDefaults.standard) where Value == Int? {
        getter = { store?.integer(forKey: key) }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write an Optional string user default.
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = UserDefaults.standard) where Value == String? {
        getter = { store?.string(forKey: key) }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write an Optional double user default.
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = UserDefaults.standard) where Value == Double? {
        getter = { store?.double(forKey: key) }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write an Optional boolean user default.
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = UserDefaults.standard) where Value == Bool? {
        getter = { store?.bool(forKey: key) }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write an Optional URL user default.
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = UserDefaults.standard) where Value == URL? {
        getter = { store?.object(forKey: key) as? URL }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can read and write an Optional data user default.
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init(_ key: String, store: UserDefaults? = UserDefaults.standard) where Value == Data? {
        getter = { store?.object(forKey: key) as? Data }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can save and restore an Optional integer, transforming it to an Optional RawRepresentable data type.
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init<R>(_ key: String, store: UserDefaults? = UserDefaults.standard) where Value == R?, R : RawRepresentable, R.RawValue == Int {
        getter = { store?.integer(forKey: key) as? R }
        setter = { store?.set($0, forKey: key) }
    }

    /// Creates a property that can save and restore an Optional string, transforming it to an Optional RawRepresentable data type.
    /// - Parameters:
    ///   - key: The key to read and write the value to in the user defaults store.
    ///   - store: The user defaults store to read and write to. A value of nil will use the user default store from the environment.
    public init<R>(_ key: String, store: UserDefaults? = UserDefaults.standard) where Value == R?, R : RawRepresentable, R.RawValue == String {
        getter = { store?.string(forKey: key) as? R }
        setter = { store?.set($0, forKey: key) }
    }
}
