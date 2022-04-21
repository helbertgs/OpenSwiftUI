import Swift

@frozen public struct WindowGroup<Content> : Scene {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Public Property(ies).

    public var body: Never { fatalError() }

    // MARK: - Private Property(ies).
    @_alwaysEmitIntoClient
    @usableFromInline var content: Content

    // MARK: - Constructor(s).

    /// Creates a window group.
    ///
    /// The window group using the given view as a template to form the content of each window in the group.
    /// - Parameter content: A clousure that creates the content for each instance of the group.
    @inlinable public init(content: () -> Content) {
        self.content = content()
    }

    /// Creates a window group with title string.
    ///
    /// The window group uses the given view as a template to form the content of each window in the group.
    /// The System uses the title to distinguish the window group in the user interface, such as
    /// in the name of commands associated with the group.
    /// - Parameters:
    ///   - title: The string to use for the title of the group.
    ///   - content: A clousure that creates the content for each instance of the group.
    @inlinable public init<S>(_ title: S, content: () -> Content) {
        self.content = content()
    }

    /// Creates a window group with an identifier.
    ///
    /// The window group uses the given view as a template to form the content of each window in the group.
    /// - Parameters:
    ///   - id: A string that uniquely identifies the window group. Identifiers must be unique among the window groups in your app.
    ///   - content: A clousure that creates the content for each instance of the group.
    @inlinable public init(id: String, content: () -> Content) {
        self.content = content()
    }

    /// Creates a window group with title string and an identifier.
    ///
    /// The window group uses the given view as a template to form the content of each window in the group.
    /// The System uses the title to distinguish the window group in the user interface, such as
    /// in the name of commands associated with the group.
    /// - Parameters:
    ///   - title: The string to use for the title of the group.
    ///   - id: A string that uniquely identifies the window group. Identifiers must be unique among the window groups in your app.
    ///   - content: A clousure that creates the content for each instance of the group.
    @inlinable public init<S>(_ title: S, id: String, content: () -> Content) {
        self.content = content()
    }
}
