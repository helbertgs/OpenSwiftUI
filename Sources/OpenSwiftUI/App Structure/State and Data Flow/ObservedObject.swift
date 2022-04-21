import Foundation
import OpenCombine
import Swift

@propertyWrapper @frozen public struct ObservedObject<ObjectType> where ObjectType : OpenCombine.ObservableObject {

    // MARK: - Internal Property(ies).

    @usableFromInline var wrapper: Wrapper

    // MARK: - Public Property(ies).

    public var wrappedValue: ObjectType
    public var projectedValue: ObservedObject<ObjectType>.Wrapper {
        .init(wrappedValue)
    }

    // MARK: - Constructor(s).

    /// Creates an observed object with an initial wrapped value.
    ///
    /// You don’t call this initializer directly. Instead, declare a property with the @ObservedObject attribute, and provide an initial value.
    /// - Parameter wrappedValue: An initial value.
    @inlinable public init(wrappedValue: ObjectType) {
        self.wrappedValue = wrappedValue
        self.wrapper = .init(self.wrappedValue)
    }


    /// Creates an observed object with an initial value.
    /// - Parameter initialValue: An initial value.
    @inlinable public init(initialValue: ObjectType) {
        self.wrappedValue = initialValue
        self.wrapper = .init(self.wrappedValue)
    }

    // MARK: - Wrapper

    /// A wrapper of the underlying observable object that can create bindings to its properties using dynamic member lookup.
    @dynamicMemberLookup @frozen public struct Wrapper {

        // MARK: - Property(ies).

        @usableFromInline var value: ObjectType

        // MARK: - Constructor(s).

        @usableFromInline init(_ value: ObjectType) {
            self.value = value
        }

        // MARK: - Subscript(s).

        public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> {
            get {
                Binding.init(
                    get: { value[keyPath: keyPath] },
                    set: { value[keyPath: keyPath] = $0 })
            }
            set { value[keyPath: keyPath] = newValue.wrappedValue }
        }
    }
}
