import Swift

/// The visibility of a UI element, chosen automatically based on
/// the platform, current context, and other factors.
///
/// For example, the preferred visibility of list row separators can be
/// configured using the ``View/listRowSeparator(_:edges:)``.
@frozen public enum Visibility : String, CaseIterable, Hashable, Sendable {

    /// The element may be visible or hidden depending on the policies of the
    /// component accepting the visibility configuration.
    ///
    /// For example, some components employ different automatic behavior
    /// depending on factors including the platform, the surrounding container,
    /// user settings, etc.
    case automatic

    /// The element may be visible.
    ///
    /// Some APIs may use this value to represent a hint or preference, rather
    /// than a mandatory assertion. For example, setting list row separator
    /// visibility to `visible` using the
    /// ``View/listRowSeparator(_:edges:)`` modifier may not always
    /// result in any visible separators, especially for list styles that do not
    /// include separators as part of their design.
    case visible

    /// The element may be hidden.
    ///
    /// Some APIs may use this value to represent a hint or preference, rather
    /// than a mandatory assertion. For example, setting confirmation dialog
    /// title visibility to `hidden` using the
    /// ``View/confirmationDialog(_:isPresented:titleVisibility:actions:)-87n66``
    /// modifier may not always hide the dialog title, which is required on
    /// some platforms.
    case hidden

    // MARK: - Case Interable.

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [Visibility]

    /// A collection of all values of this type.
    public static var allCases: [Visibility] { [ .automatic, .visible ] }

    // MARK: - Equatable.

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Visibility, rhs: Visibility) -> Bool {
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
