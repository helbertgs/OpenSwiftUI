import Foundation

/// Designates an accessibility action category that is provided and named by the system.
@frozen public struct AccessibilityActionCategory: Equatable, Sendable {

    // MARK: - Type Properties
    
    /// An accessibility action category for the default actions of a view. This category replaces the system provided actions rotor for accessibility technologies like VoiceOver.
    public static let `default`: AccessibilityActionCategory = .init(.init())
    
    /// An accessibility action category for associating actions related to editing text. This category replaces the system provided Edit actions for accessibility technologies like VoiceOver.
    public static let edit: AccessibilityActionCategory = .init(.init())

    /// The name for the category of the accessibility actions.
    public let name: Text

    // MARK: - Initializers

    /// Creates a custom action category labeled by name.
    /// - Parameter name: The name for the category of the accessibility actions.
    @inlinable public init(_ name: Text) {
        self.name = name
    }
}