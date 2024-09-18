import Foundation

/// Defines the behavior for the child elements of the new parent element.
public struct AccessibilityChildBehavior: Equatable, Hashable, Sendable {

    // MARK: - Getting behaviors

    /// Any child accessibility element’s properties are merged into the new accessibility element.
    public static let combine: AccessibilityChildBehavior = .init()

    /// Any child accessibility elements become children of the new accessibility element.
    public static let contain: AccessibilityChildBehavior = .init()

    /// Any child accessibility elements become hidden.
    public static let ignore: AccessibilityChildBehavior = .init()

    // MARK: - Create a Behaviour

    public init() { 
    }
}