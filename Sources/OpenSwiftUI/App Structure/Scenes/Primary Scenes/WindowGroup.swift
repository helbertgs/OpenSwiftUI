import Swift

/// A scene that presents a group of identically structured windows.
///
/// Use a `WindowGroup` as a container for a view hierarchy presented by your
/// app. The hierarchy that you declare as the group's content serves as a
/// template for each window that the app creates from that group:
///
///     @main
///     struct Mail: App {
///         var body: some Scene {
///             WindowGroup {
///                 MailViewer() // Declare a view hierarchy here.
///             }
///         }
///     }
///
/// OpenSwiftUI takes care of certain platform-specific behaviors. For example,
/// on platforms that support it, like macOS and iPadOS, users can open more
/// than one window from the group simultaneously. In macOS, users
/// can gather open windows together in a tabbed interface. Also in macOS,
/// window groups automatically provide commands for standard window
/// management.
///
/// Every window created from the group maintains independent state. For
/// example, for each new window created from the group the system allocates new
/// storage for any ``State`` or ``StateObject`` variables instantiated by the
/// scene's view hierarchy.
///
/// You typically use a window group for the main interface of an app that isn't
/// document-based. For document-based apps, use a ``DocumentGroup`` instead.
@frozen public struct WindowGroup<Content> : Scene {

    // MARK: - Type Alias.

    /// The type of scene that represents the body of this scene.
    ///
    /// When you create a custom scene, Swift infers this type from your
    /// implementation of the required ``OpenSwiftUI/Scene/body-swift.property``
    /// property.
    public typealias Body = Never

    // MARK: - Public Property(ies).

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from built-in scenes that OpenSwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``OpenSwiftUI/Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    public var body: Never { fatalError() }

    // MARK: - Private Property(ies).

    @_alwaysEmitIntoClient
    @usableFromInline var content: Content

    // MARK: - Constructor(s).

    /// Creates a window group.
    ///
    /// The window group using the given view as a template to form the
    /// content of each window in the group.
    ///
    /// - Parameter content: A closure that creates the content for each
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
    /// The window group uses the given view as a
    /// template to form the content of each window in the group.
    ///
    /// - Parameters:
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    @inlinable public init(id: String, content: () -> Content) {
        self.content = content()
    }

    /// Creates a window group with a title string and an identifier.
    ///
    /// The window group uses the given view as a template to form the content
    /// of each window in the group.
    /// The system uses the title to distinguish the window group in the user
    /// interface, such as in the name of commands associated with the group.
    ///
    /// - Parameters:
    ///   - title: The string to use for the title of the group.
    ///   - id: A string that uniquely identifies the window group. Identifiers
    ///     must be unique among the window groups in your app.
    ///   - content: A closure that creates the content for each instance
    ///     of the group.
    @inlinable public init<S>(_ title: S, id: String, content: () -> Content) {
        self.content = content()
    }
}
