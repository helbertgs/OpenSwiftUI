import Foundation

public struct AccessibilitySystemRotor: Sendable {

    // MARK: - Iterating through text

    /// System Rotor allowing users to iterate through all text fields.
    public static let textFields: AccessibilitySystemRotor = .init()

    /// System Rotor allowing users to iterate through all the ranges of bolded text.
    public static let boldText: AccessibilitySystemRotor = .init()

    /// System Rotor allowing users to iterate through all the ranges of italicized text.
    public static let italicText: AccessibilitySystemRotor = .init()

    /// System Rotor allowing users to iterate through all the ranges of underlined text.
    public static let underlineText: AccessibilitySystemRotor = .init()

    /// System Rotor allowing users to iterate through all the ranges of mis-spelled words.
    public static let misspelledWords: AccessibilitySystemRotor = .init()

    // MARK: - Iterating through headings

    /// System Rotor allowing users to iterate through all headings.
    public static let headings: AccessibilitySystemRotor = .init()

    /// System Rotors allowing users to iterate through all headings, of various heading levels.
    public static func headings(level: AccessibilityHeadingLevel) -> AccessibilitySystemRotor {
        .init()
    }

    // MARK: - Iterating through links

    /// System Rotor allowing users to iterate through all links.
    public static let links: AccessibilitySystemRotor = .init()

    /// System Rotors allowing users to iterate through links or visited links.
    public static func links(visited: Bool) -> AccessibilitySystemRotor {
        .init()
    }

    // MARK: - Iterating through other elements

    /// System Rotor allowing users to iterate through all images.
    public static let images: AccessibilitySystemRotor = .init()

    /// System Rotor allowing users to iterate through all landmarks.
    public static let landmarks: AccessibilitySystemRotor = .init()

    /// System Rotor allowing users to iterate through all lists.
    public static let lists: AccessibilitySystemRotor = .init()

    /// System Rotor allowing users to iterate through all tables.
    public static let tables: AccessibilitySystemRotor = .init()

    init() { }
}