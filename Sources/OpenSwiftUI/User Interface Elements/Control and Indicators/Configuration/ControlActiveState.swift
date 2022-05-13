import Swift

@available(macCatalyst 13.0, macOS 10.15, Windows 10, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum ControlActiveState : String, CaseIterable, Equatable, Hashable {

    // MARK: - Case(s).

    case key
    case active
    case inactive

    // MARK: - Case Interable.

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ControlActiveState]

    /// A collection of all values of this type.
    public static var allCases: [ControlActiveState] { [ .key, .active, .inactive ] }

    // MARK: - Equatable.

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ControlActiveState, rhs: ControlActiveState) -> Bool {
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
