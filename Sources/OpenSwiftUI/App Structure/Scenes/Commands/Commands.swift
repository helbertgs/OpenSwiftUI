import Swift

/// Conforming types represent a group of related commands that can be exposed to the user via the main menu on macOS and key commands on iOS.
public protocol Commands {

    // MARK: - Associated Type(s).

    /// The type of commands that represents the body of this command hierarchy.
    /// When you create custom commands, Swift infers this type from your implementation of the required body property.
    associatedtype Body : Commands

    // MARK: - Property(ies).

    /// The contents of the command hierarchy.
    /// For any commands that you create, provide a computed body property that defines the scene as a composition of other scenes. 
    /// You can assemble a command hierarchy from built-in commands that SwiftUI provides, as well as other commands that you’ve defined.
    var body : Self.Body { get }
}