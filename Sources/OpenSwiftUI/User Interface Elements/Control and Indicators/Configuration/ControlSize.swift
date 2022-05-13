import Swift

/// The size classes, like regular or small, that you can apply to controls
/// within a view.
@available(iOS 15.0, macOS 10.15, Windows 10, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum ControlSize : String, CaseIterable, Equatable, Hashable {

    // MARK: - Case(s).

    /// A control version that is minimally sized.
    case mini

    /// A control version that is proportionally smaller size for space-constrained views.
    case small

    /// A control version that is the default size.
    case regular

    /// A control version that is prominently sized.
    @available(macOS 11.0, Windows 10, *)
    case large

    // MARK: - Case Interable.

    /// A collection of all values of this type.
    public static var allCases: [ControlSize] {
        if #available(macOS 11.0, Windows 10, *) {
            return [ .mini, .small, .regular, .large ]
        }

        return [ .mini, .small, .regular ]
    }

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ControlSize]

    // MARK: - Equatable.

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ControlSize, rhs: ControlSize) -> Bool {
        lhs.rawValue == rhs.rawValue
    }

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
