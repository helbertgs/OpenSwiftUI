import Swift

/// A type indicating the prominence of a view hierarchy.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, Windows 10, *)
public enum Prominence : String, Equatable, Hashable {

    // MARK: - Case(s).

    /// The standard prominence.
    case standard

    /// An increased prominence.
    ///
    /// - Note: Not all views will react to increased prominence.
    case increased

    // MARK: - Equatable.

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Prominence, rhs: Prominence) -> Bool {
        lhs.rawValue == rhs.rawValue
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
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}
