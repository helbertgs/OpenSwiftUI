#if os(iOS) || os(macOS)
import Combine
#else
import OpenCombine
#endif
import Foundation
import Swift

/// A property wrapper type that subscribes to an observable object and
/// invalidates a view whenever the observable object changes.
@propertyWrapper @frozen public struct ObservedObject<ObjectType> where ObjectType : ObservableObject {

    // MARK: - Internal Property(ies).

    @usableFromInline var wrapper: Wrapper

    // MARK: - Public Property(ies).

    public var wrappedValue: ObjectType {
        wrapper.wrappedValue
    }

    public var projectedValue: ObservedObject<ObjectType>.Wrapper {
        wrapper
    }

    // MARK: - Constructor(s).

    /// Creates an observed object with an initial value.
    /// - Parameter initialValue: An initial value.
    @inlinable public init(wrappedValue: ObjectType) {
        self.wrapper = .init(wrappedValue: wrappedValue)
    }

    // MARK: - Wrapper

    /// A wrapper of the underlying observable object that can create bindings to
    /// its properties using dynamic member lookup.
    @dynamicMemberLookup @frozen public struct Wrapper {

        // MARK: - Property(ies).

        /// The underlying value referenced by the observed object.
        ///
        /// This property provides primary access to the value's data. However, you
        /// don't access `wrappedValue` directly. Instead, you use the property
        /// variable created with the `@ObservedObject` attribute.
        ///
        /// When a mutable value changes, the new value is immediately available.
        /// However, a view displaying the value is updated asynchronously and may
        /// not show the new value immediately.
        public var wrappedValue: ObjectType

        /// A projection of the observed object that creates bindings to its
        /// properties using dynamic member lookup.
        ///
        /// Use the projected value to pass a binding value down a view hierarchy.
        /// To get the `projectedValue`, prefix the property variable with `$`.
        public var projectedValue: ObservedObject<ObjectType>.Wrapper {
            ObservedObject(wrappedValue: wrappedValue).wrapper
        }

        // MARK: - Constructor(s).

        /// Creates an observed object with an initial wrapped value.
        ///
        /// You don't call this initializer directly. Instead, declare a property
        /// with the `@ObservedObject` attribute, and provide an initial value.
        ///
        /// - Parameter wrappedValue: An initial value.
        public init(wrappedValue: ObjectType) {
            self.wrappedValue = wrappedValue
        }

        // MARK: - Subscript(s).

        /// Returns a binding to the resulting value of a given key path.
        ///
        /// - Parameter keyPath  : A key path to a specific resulting value.
        ///
        /// - Returns: A new binding.
        public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> {
            get {
                Binding.init(
                    get: { wrappedValue[keyPath: keyPath] },
                    set: { wrappedValue[keyPath: keyPath] = $0 })
            }
            set { wrappedValue[keyPath: keyPath] = newValue.wrappedValue }
        }
    }
}
