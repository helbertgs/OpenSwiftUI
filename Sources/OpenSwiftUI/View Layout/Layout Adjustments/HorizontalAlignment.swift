import Swift

/// An alignment position along the horizontal axis.
@frozen public struct HorizontalAlignment : Equatable, Hashable {

    // MARK: - Private Property(ies).

    @usableFromInline let key: AlignmentKey

    // MARK: - Static Property(ies).
    /// A guide marking the leading edge of the view.
    public static let leading: HorizontalAlignment = .init(key: .init(bits: 4))

    /// A guide marking the horizontal center of the view.
    public static let center: HorizontalAlignment = .init(key: .init(bits: 2))

    /// A guide marking the trailing edge of the view.
    public static let trailing: HorizontalAlignment = .init(key: .init(bits: 6))

    // MARK: - Constructor(s).
    /// Creates an instance with the given identifier.
    ///
    /// Each instance needs a unique identifier.
    ///
    /// - Parameter id: An identifier that uniquely identifies the horizontal
    ///   alignment.
    public init(_ id: AlignmentID.Type) {
        self.key = .init(bits: ObjectIdentifier(id).hashValue)
    }

    init(key: AlignmentKey) {
        self.key = key
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
    @inlinable public static func == (lhs: HorizontalAlignment, rhs: HorizontalAlignment) -> Bool {
        lhs.key == rhs.key
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
        hasher.combine(key)
    }
}
