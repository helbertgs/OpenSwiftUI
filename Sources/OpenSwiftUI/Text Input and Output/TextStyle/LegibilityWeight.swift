import Swift

/// The Accessibility Bold Text user setting options.
///
/// The app can't override the user's choice.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 1, *)
public enum LegibilityWeight : String, Equatable, Hashable {

    // MARK: - Case(s).

    /// Use regular font weight (no Accessibility Bold).
    case regular

    /// Use heavier font weight (force Accessibility Bold).
    case bold

    // MARK: - Equatable.

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: LegibilityWeight, rhs: LegibilityWeight) -> Bool {
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
