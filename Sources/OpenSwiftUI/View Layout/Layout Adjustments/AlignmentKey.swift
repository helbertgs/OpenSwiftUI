import Swift

@usableFromInline @frozen struct AlignmentKey: Equatable, Hashable {

    // MARK: - Public Property(ies).

    @usableFromInline let bits: Int

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
    @usableFromInline func hash(into hasher: inout Hasher) {
        hasher.combine(bits)
    }

    // MARK: - Equatable
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @usableFromInline static func == (lhs: AlignmentKey, rhs: AlignmentKey) -> Bool {
        lhs.bits == rhs.bits
    }
}
