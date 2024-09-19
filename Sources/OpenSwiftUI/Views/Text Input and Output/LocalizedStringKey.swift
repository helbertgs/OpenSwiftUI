import Foundation

@frozen
public struct LocalizedStringKey: Equatable, ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByStringInterpolation, ExpressibleByStringLiteral, ExpressibleByUnicodeScalarLiteral, Sendable {

    var value: String

    // MARK: - Creating a key from a literal value

    /// Creates a localized string key from the given string value.
    /// - Parameter value: The string to use as a localization key.
    public init(_ value: String) {
        self.value = value
    }

    /// Creates a localized string key from the given string literal.
    /// - Parameter value: The string literal to use as a localization key.
    public init(stringLiteral value: String) {
        self.value = value
    }

    // MARK: - Creating a key from an interpolation 

    /// Creates a localized string key from the given string interpolation.
    /// - Parameter stringInterpolation: The string interpolation to use as the localization key.
    public init(stringInterpolation: LocalizedStringKey.StringInterpolation) {
        self.value = "\(stringInterpolation)"
    }
}