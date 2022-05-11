import OpenCombine
import Swift

/// A property wrapper type for an observable object supplied by a parent or
/// ancestor view.
///
/// An environment object invalidates the current view whenever the observable
/// object changes. If you declare a property as an environment object, be sure
/// to set a corresponding model object on an ancestor view by calling its
/// ``View/environmentObject(_:)`` modifier.
@frozen @propertyWrapper public struct EnvironmentObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {

    // MARK: - Property(ies).

    @usableFromInline var _seed: Int = 0
    @usableFromInline var _store: ObjectType?

    /// The underlying value referenced by the environment object.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the ``EnvironmentObject`` attribute.
    ///
    /// When a mutable value changes, the new value is immediately available.
    /// However, a view displaying the value is updated asynchronously and may
    /// not show the new value immediately.
    @inlinable public var wrappedValue: ObjectType {
        guard let store = _store else { fatalError() }
        return store
    }

    /// A projection of the environment object that creates bindings to its
    /// properties using dynamic member lookup.
    ///
    /// Use the projected value to pass an environment object down a view
    /// hierarchy.
    public var projectedValue: EnvironmentObject<ObjectType>.Wrapper {
        .init(root: wrappedValue)
    }

    // MARK: - Constructor(s).

    /// Creates an environment object.
    public init() { }

    /// A wrapper of the underlying environment object that can create bindings
    /// to its properties using dynamic member lookup.
    @dynamicMemberLookup @frozen public struct Wrapper {

        let root: ObjectType

        /// Returns a binding to the resulting value of a given key path.
        ///
        /// - Parameter keyPath: A key path to a specific resulting value.
        ///
        /// - Returns: A new binding.
        public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> {
            Binding.init(get: { root[keyPath: keyPath] }, set: { root[keyPath: keyPath] = $0 })
        }
    }
}
