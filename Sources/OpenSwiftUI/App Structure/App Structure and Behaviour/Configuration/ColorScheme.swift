import Swift

/// The possible types of color schemes, like Dark Mode.
///
/// The color scheme enumerates the user setting options for Light or Dark Mode.
/// It also provides the light or dark options for any particular view when the
/// app wants to override the user setting.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10.0, *)
@frozen public enum ColorScheme: CaseIterable, Equatable, Hashable {

    // MARK: - Case(s).

    /// Dark mode.
    case dark

    /// Light mode
    case light

    // MARK: - Type Alias.

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ColorScheme]

    // MARK: - Static Property(ies).

    /// A collection of all values of this type.
    public static var allCases: [ColorScheme] = [ .dark, .light ]

    // MARK: - Hashable

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
        hasher.combine(self)
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
    @inlinable public static func == (lhs: ColorScheme, rhs: ColorScheme) -> Bool {
        switch (lhs, rhs) {
            case (.dark, .dark): return true
            case (.light, .light): return true
            default: return false
        }
    }
}
