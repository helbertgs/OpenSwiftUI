import Foundation

/// The contrast between the app's foreground and background colors.
///
/// You receive a contrast value when you read the
/// ``EnvironmentValues/colorSchemeContrast`` environment value. The value
/// tells you if a standard or increased contrast currently applies to the view.
/// OpenSwiftUI updates the value whenever the contrast changes, and redraws
/// views that depend on the value. For example, the following ``Text`` view
/// automatically updates when the user enables increased contrast:
///
///     @Environment(\.colorSchemeContrast) private var colorSchemeContrast
///
///     var body: some View {
///         Text(colorSchemeContrast == .standard ? "Standard" : "Increased")
///     }
///
/// The user sets the contrast by selecting the Increase Contrast option in
/// Accessibility > Display in System Preferences on macOS, or
/// Accessibility > Display & Text Size in the Settings app on iOS.
/// Your app can't override the user's choice. For
/// information about using color and contrast in your app, see
/// [Color and Contrast](https://developer.apple.com/design/human-interface-guidelines/accessibility/overview/color-and-contrast).
@frozen public enum ColorSchemeContrast : CaseIterable, Equatable, Hashable, Sendable {

    // MARK: - Case(s).

    /// OpenSwiftUI displays views with standard contrast between the app's
    /// foreground and background colors.
    case standard

    /// OpenSwiftUI displays views with increased contrast between the app's
    /// foreground and background colors.
    case increased

    // MARK: - Type Alias.

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ColorSchemeContrast]

    // MARK: - Static Property(ies).

    /// A collection of all values of this type.
    public static let allCases: [ColorSchemeContrast] = [ .standard, .increased ]

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
    @inlinable public static func == (lhs: ColorSchemeContrast, rhs: ColorSchemeContrast) -> Bool {
        switch (lhs, rhs) {
            case (.standard, .standard): return true
            case (.increased, .increased): return true
            default: return false
        }
    }
}
