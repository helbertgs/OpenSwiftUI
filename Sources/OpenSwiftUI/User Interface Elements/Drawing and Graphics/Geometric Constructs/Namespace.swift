import Swift

/// A dynamic property type that allows access to a namespace defined
/// by the persistent identity of the object containing the property
/// (e.g. a view).
@frozen @propertyWrapper public struct Namespace : DynamicProperty {

    /// Creating a Namespace.
    @inlinable public init() {
        wrappedValue = ID(0)
    }

    public var wrappedValue: Namespace.ID

    /// A namespace defined by the persistent identity of an
    /// `@Namespace` dynamic property.
    @frozen public struct ID : Hashable, Sendable {

        @usableFromInline let id: Int

        @inlinable public init(_ id: Int) {
            self.id = id
        }

        // MARK: - Hashable.

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        @inlinable public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        // MARK: - Equatable.

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        @inlinable  public static func == (lhs: Namespace.ID, rhs: Namespace.ID) -> Bool {
            lhs.id == rhs.id
        }
    }
}
