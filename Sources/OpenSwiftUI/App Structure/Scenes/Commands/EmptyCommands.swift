import Swift

public struct EmptyCommands : Commands {

    // MARK: - Type Alias.

    /// The type of commands that represents the body of this command hierarchy.
    ///
    /// When you create custom commands, Swift infers this type from your
    /// implementation of the required ``OpenSwiftUI/Commands/body-swift.property``
    /// property.
    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never { fatalError() }

    // MARK: - Constructor(s).

    /// Creates an empty command hierarchy.
    @inlinable public init() { }
}
