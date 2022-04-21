import Swift

public protocol App {

    // MARK: - Associated Type(s).

    /// The type of scene representing the content of the app.
    ///
    /// When you create a custom app, Swift infers this type from your
    /// implementation of the required ``OpenSwiftUI/App/body-swift.property``
    /// property.
    associatedtype Body : Scene

    // MARK: - Property(ies).

    /// The content and behavior of the app.
    ///
    /// For any app that you create, provide a computed `body` property that
    /// defines your app's scenes, which are instances that conform to the
    /// ``OpenSwiftUI/Scene`` protocol. For example, you can create a simple app
    /// with a single scene containing a single view:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 Text("Hello, world!")
    ///             }
    ///         }
    ///     }
    ///
    /// Swift infers the app's ``OpenSwiftUI/App/Body-swift.associatedtype``
    /// associated type based on the scene provided by the `body` property.
    var body: Self.Body { get }

    // MARK: - Constructor(s).

    /// Creates an instance of the app using the body that you define for its
    /// content.
    ///
    /// Swift synthesizes a default initializer for structures that don't
    /// provide one. You typically rely on the default initializer for
    /// your app.
    init()

    // MARK: - Static Function(s).

    /// Initializes and runs the app.
    ///
    /// If you precede your ``OpenSwiftUI/App`` conformer's declaration with the
    /// [@main](https://docs.swift.org/swift-book/ReferenceManual/Attributes.html#ID626)
    /// attribute, the system calls the conformer's `main()` method to launch
    /// the app. OpenSwiftUI provides a
    /// default implementation of the method that manages the launch process in
    /// a platform-appropriate way.
    static func main()
}
