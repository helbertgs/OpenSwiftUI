import Swift

/// Key equivalents consist of a letter, punctuation, or function key that can
/// be combined with an optional set of modifier keys to specify a keyboard
/// shortcut.
///
/// Key equivalents are used to establish keyboard shortcuts to app
/// functionality. Any key can be used as a key equivalent as long as pressing
/// it produces a single character value. Key equivalents are typically
/// initialized using a single-character string literal, with constants for
/// unprintable or hard-to-type values.
///
/// The modifier keys necessary to type a key equivalent are factored in to the
/// resulting keyboard shortcut. That is, a key equivalent whose raw value is
/// the capitalized string "A" corresponds with the keyboard shortcut
/// Command-Shift-A. The exact mapping may depend on the keyboard layout—for
/// example, a key equivalent with the character value "}" produces a shortcut
/// equivalent to Command-Shift-] on ANSI keyboards, but would produce a
/// different shortcut for keyboard layouts where punctuation characters are in
/// different locations.
@available(iOS 13.0, macOS 10.15, tvOS 17.0, *)
@available(watchOS, unavailable)
public struct KeyEquivalent : Sendable {
    
    // MARK: - Property(ies).
    
    /// The character value that the key equivalent represents.
    public let character: Character
    
    // MARK: - Static Property(ies).

    /// Up Arrow (U+F700)
    public static let upArrow: KeyEquivalent = "\u{08}"

    /// Down Arrow (U+F701)
    public static let downArrow: KeyEquivalent = "\u{F701}"

    /// Left Arrow (U+F702)
    public static let leftArrow: KeyEquivalent = "\u{F702}"

    /// Right Arrow (U+F703)
    public static let rightArrow: KeyEquivalent = "\u{F703}"

    /// Escape (U+001B)
    public static let escape: KeyEquivalent = "\u{1B}"

    /// Delete (U+0008)
    public static let delete: KeyEquivalent = "\u{08}"

    /// Delete Forward (U+F728)
    public static let deleteForward: KeyEquivalent = "\u{F728}"

    /// Home (U+F729)
    public static let home: KeyEquivalent = "\u{F729}"

    /// End (U+F72B)
    public static let end: KeyEquivalent = "\u{F72B}"

    /// Page Up (U+F72C)
    public static let pageUp: KeyEquivalent = "\u{F72C}"

    /// Page Down (U+F72D)
    public static let pageDown: KeyEquivalent = "\u{F72D}"

    /// Clear (U+F739)
    public static let clear: KeyEquivalent = "\u{F739}"

    /// Tab (U+0009)
    public static let tab: KeyEquivalent = "\t"

    /// Space (U+0020)
    public static let space: KeyEquivalent = " "

    /// Return (U+000D)
    public static let `return`: KeyEquivalent = "\r"

    /// Creates a new key equivalent from the given character value.
    public init(_ character: Character) {
        self.character = character
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 17.0, *)
@available(watchOS, unavailable)
extension KeyEquivalent : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(character)
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: KeyEquivalent, b: KeyEquivalent) -> Bool {
        a.character == b.character
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 17.0, *)
@available(watchOS, unavailable)
extension KeyEquivalent : ExpressibleByExtendedGraphemeClusterLiteral {

    // MARK: - Type Alias.

    /// A type that represents an extended grapheme cluster literal.
    ///
    /// Valid types for `ExtendedGraphemeClusterLiteralType` are `Character`,
    /// `String`, and `StaticString`.
    public typealias ExtendedGraphemeClusterLiteralType = Character

    /// A type that represents a Unicode scalar literal.
    ///
    /// Valid types for `UnicodeScalarLiteralType` are `Unicode.Scalar`,
    /// `Character`, `String`, and `StaticString`.
    public typealias UnicodeScalarLiteralType = Character

    // MARK: - Constructor(s).
    
    /// Creates an instance initialized to the given value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(extendedGraphemeClusterLiteral: Character) {
        self.character = extendedGraphemeClusterLiteral
    }
}
