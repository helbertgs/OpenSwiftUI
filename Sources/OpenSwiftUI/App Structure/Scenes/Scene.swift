import Foundation
#if canImport(Combine)
import Combine
#else
import OpenCombine
#endif

/// A part of an app's user interface with a life cycle managed by the
/// system.
///
/// You create an ``OpenSwiftUI/App`` by combining one or more instances
/// that conform to the `Scene` protocol in the app's
/// ``OpenSwiftUI/App/body-swift.property``. You can use the built-in scenes that
/// OpenSwiftUI provides, like ``OpenSwiftUI/WindowGroup``, along with custom scenes
/// that you compose from other scenes. To create a custom scene, declare a
/// type that conforms to the `Scene` protocol. Implement the required
/// ``OpenSwiftUI/Scene/body-swift.property`` computed property and provide the
/// content for your custom scene:
///
///     struct MyScene: Scene {
///         var body: some Scene {
///             WindowGroup {
///                 MyRootView()
///             }
///         }
///     }
///
/// A scene acts as a container for a view hierarchy that you want to display
/// to the user. The system decides when and how to present the view hierarchy
/// in the user interface in a way that's platform-appropriate and dependent
/// on the current state of the app. For example, for the window group shown
/// above, the system lets the user create or remove windows that contain
/// `MyRootView` on platforms like macOS and iPadOS. On other platforms, the
/// same view hierarchy might consume the entire display when active.
///
/// Read the ``OpenSwiftUI/EnvironmentValues/scenePhase`` environment
/// value from within a scene or one of its views to check whether a scene is
/// active or in some other state. You can create a property that contains the
/// scene phase, which is one of the values in the ``OpenSwiftUI/ScenePhase``
/// enumeration, using the ``OpenSwiftUI/Environment`` attribute:
///
///     struct MyScene: Scene {
///         @Environment(\.scenePhase) private var scenePhase
///
///         // ...
///     }
///
/// The `Scene` protocol provides scene modifiers, defined as protocol methods
/// with default implementations, that you use to configure a scene. For
/// example, you can use the ``OpenSwiftUI/Scene/onChange(of:perform:)`` modifier to
/// trigger an action when a value changes. The following code empties a cache
/// when all of the scenes in the window group have moved to the background:
///
///     struct MyScene: Scene {
///         @Environment(\.scenePhase) private var scenePhase
///         @StateObject private var cache = DataCache()
///
///         var body: some Scene {
///             WindowGroup {
///                 MyRootView()
///             }
///             .onChange(of: scenePhase) { newScenePhase in
///                 if newScenePhase == .background {
///                     cache.empty()
///                 }
///             }
///         }
///     }
public protocol Scene {

    // MARK: - Associated Type(s).

    /// The type of scene that represents the body of this scene.
    ///
    /// When you create a custom scene, Swift infers this type from your
    /// implementation of the required ``OpenSwiftUI/Scene/body-swift.property``
    /// property.
    associatedtype Body : Scene

    // MARK: - Property(ies).

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from built-in scenes that OpenSwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``OpenSwiftUI/Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    @SceneBuilder var body: Self.Body { get }

    static func _makeScene(scene: _GraphValue<Self>, inputs: _SceneInputs) -> _SceneOutputs
}

extension Scene {
    @inlinable internal func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(content: self, modifier: modifier)
    }
}

extension Scene {

    /// Adds an action to perform when the given value changes.
    ///
    /// Use this modifier to trigger a side effect when a value changes, like
    /// the value associated with an ``SwiftUI/Environment`` key or a
    /// ``SwiftUI/Binding``. For example, you can clear a cache when you notice
    /// that a scene moves to the background:
    ///
    ///     struct MyScene: Scene {
    ///         @Environment(\.scenePhase) private var scenePhase
    ///         @StateObject private var cache = DataCache()
    ///
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 MyRootView(cache: cache)
    ///             }
    ///             .onChange(of: scenePhase) { oldScenePhase, newScenePhase in
    ///                 if newScenePhase == .background {
    ///                     cache.empty()
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// The system may call the action closure on the main actor, so avoid
    /// long-running tasks in the closure. If you need to perform such tasks,
    /// detach an asynchronous background task:
    ///
    ///     .onChange(of: scenePhase) { oldScenePhase, newScenePhase in
    ///         if newScenePhase == .background {
    ///             Task.detached(priority: .background) {
    ///                 // ...
    ///             }
    ///         }
    ///     }
    ///
    /// When the value changes, the new version of the closure will be called,
    /// so any captured values will have their values from the time that the
    /// observed value has its new value. The system passes the old and new
    /// observed values into the closure.
    ///
    /// - Parameters:
    ///   - value: The value to check when determining whether to run the
    ///     closure. The value must conform to the
    ///     <doc://com.apple.documentation/documentation/Swift/Equatable>
    ///     protocol.
    ///   - initial: Whether the action should be run when this scene initially
    ///     appears.
    ///   - action: A closure to run when the value changes.
    ///   - oldValue: The old value that failed the comparison check (or the
    ///     initial value when requested).
    ///   - newValue: The new value that failed the comparison check.
    ///
    /// - Returns: A scene that triggers an action in response to a change.
    public func onChange<V>(of value: V, initial: Bool = false, _ action: @escaping (_ oldValue: V, _ newValue: V) -> Void) -> some Scene where V : Equatable {
        modifier(_ValueActionModifier2(value: value, action: action))
    }

    /// Adds an action to perform when the given value changes.
    ///
    /// Use this modifier to trigger a side effect when a value changes, like
    /// the value associated with an ``SwiftUI/Environment`` key or a
    /// ``SwiftUI/Binding``. For example, you can clear a cache when you notice
    /// that a scene moves to the background:
    ///
    ///     struct MyScene: Scene {
    ///         @Environment(\.locale) private var locale
    ///         @StateObject private var cache = LocalizationDataCache()
    ///
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 MyRootView(cache: cache)
    ///             }
    ///             .onChange(of: locale) {
    ///                 cache.empty()
    ///             }
    ///         }
    ///     }
    ///
    /// The system may call the action closure on the main actor, so avoid
    /// long-running tasks in the closure. If you need to perform such tasks,
    /// detach an asynchronous background task:
    ///
    ///     .onChange(of: locale) {
    ///         Task.detached(priority: .background) {
    ///             // ...
    ///         }
    ///     }
    ///
    /// When the value changes, the new version of the closure will be called,
    /// so any captured values will have their values from the time that the
    /// observed value has its new value.
    ///
    /// - Parameters:
    ///   - value: The value to check when determining whether to run the
    ///     closure. The value must conform to the
    ///     <doc://com.apple.documentation/documentation/Swift/Equatable>
    ///     protocol.
    ///   - initial: Whether the action should be run when this scene initially
    ///     appears.
    ///   - action: A closure to run when the value changes.
    ///
    /// - Returns: A scene that triggers an action in response to a change.
    public func onChange<V>(of value: V, initial: Bool = false, _ action: @escaping () -> Void) -> some Scene where V : Equatable {
        modifier(_ValueActionModifier2(value: value, action: action))
    }
}

extension Scene {

    /// Places an observable object in the scene's environment.
    ///
    /// Use this modifier to place an object that you declare with the
    /// <doc://com.apple.documentation/documentation/Observation/Observable()>
    /// macro into a scene's environment. For example, you can add an instance
    /// of a custom observable `Profile` class to the environment of a
    /// ``WindowGroup`` scene:
    ///
    ///     @Observable class Profile { ... }
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some View {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             .environment(Profile.currentProfile)
    ///         }
    ///     }
    ///
    /// You then read the object inside `ContentView` or one of its descendants
    /// using the ``Environment`` property wrapper:
    ///
    ///     struct ContentView: View {
    ///         @Environment(Profile.self) private var currentProfile: Profile
    ///
    ///         var body: some View { ... }
    ///     }
    ///
    /// This modifier affects the given scene, as well as the scene's descendant
    /// views. It has no effect outside the view hierarchy on which you call it.
    /// The environment of a given view hierarchy holds only one observable
    /// object of a given type.
    ///
    /// - Note: This modifier takes an object that conforms to the
    ///   <doc://com.apple.documentation/documentation/Observation/Observable>
    ///   protocol. To add environment objects that conform to the
    ///   <doc://com.apple.documentation/documentation/Combine/ObservableObject>
    ///   protocol, use ``Scene/environmentObject(_:)`` instead.
    ///
    /// - Parameter object: The object to set for this object's type in the
    ///   environment, or `nil` to clear an object of this type from the
    ///   environment.
    ///
    /// - Returns: A scene that has the specified object in its environment.
    @available(iOS 17.0, macOS 14, *)
    @available(Windows, unavailable)
    @inlinable
    public func environment<T>(_ object: T?) -> some Scene where T : AnyObject, T : Observable {
        modifier(EmptyModifier())
    }
    
    /// Supplies an `ObservableObject` to a view subhierarchy.
    ///
    /// The object can be read by any child by using `EnvironmentObject`:
    ///
    ///     final class Profile: ObservableObject { ... }
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some View {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             .environment(ProfileService.currentProfile)
    ///         }
    ///     }
    ///
    /// You then read the object inside `ContentView` or one of its descendants
    /// using the ``EnvironmentObject`` property wrapper:
    ///
    ///     struct ContentView: View {
    ///         @EnvironmentObject private var currentAccount: Account
    ///
    ///         var body: some View { ... }
    ///     }
    ///
    /// - Parameter object: the object to store and make available to
    ///   the scene's subhierarchy.
    @inlinable public func environmentObject<T>(_ object: T) -> some Scene where T : ObservableObject {
        modifier(EmptyModifier())
    }
    
    /// Sets the environment value of the specified key path to the given value.
    ///
    /// Use this modifier to set one of the writable properties of the
    /// ``EnvironmentValues`` structure, including custom values that you
    /// create. For example, you can create a custom environment key
    /// `styleOverrides` to set a value that represents style settings that for
    /// the entire app:
    ///
    ///     WindowGroup {
    ///         ContentView()
    ///     }
    ///     .environment(\.styleOverrides, StyleOverrides())
    ///
    /// You then read the value inside `ContentView` or one of its descendants
    /// using the ``Environment`` property wrapper:
    ///
    ///     struct MyView: View {
    ///         @Environment(\.styleOverrides) var styleOverrides: StyleOverrides
    ///
    ///         var body: some View { ... }
    ///     }
    ///
    /// This modifier affects the given scene,
    /// as well as that scene's descendant views. It has no effect
    /// outside the view hierarchy on which you call it.
    ///
    /// - Parameters:
    ///   - keyPath: A key path that indicates the property of the
    ///     ``EnvironmentValues`` structure to update.
    ///   - value: The new value to set for the item specified by `keyPath`.
    ///
    /// - Returns: A view that has the given value set in its environment.
    @inlinable public func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> some Scene {
        modifier(_EnvironmentKeyWritingModifier(keyPath: keyPath, value: value))
    }
}

extension Scene {

    /// The default store used by `AppStorage` contained within the scene and
    /// its view content.
    ///
    /// If unspecified, the default store for a view hierarchy is
    /// `UserDefaults.standard`, but can be set a to a custom one. For example,
    /// sharing defaults between an app and an extension can override the
    /// default store to one created with `UserDefaults.init(suiteName:_)`.
    ///
    /// - Parameter store: The user defaults to use as the default
    ///   store for `AppStorage`.
    public func defaultAppStorage(_ store: UserDefaults) -> some Scene {
        environment(\.defaultAppStorage, store)
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {

    /// Specifies a modifier to indicate if this Scene can be used
    /// when creating a new Scene for the received External Event.
    ///
    /// This modifier is only supported for WindowGroup Scene types.
    ///
    /// For DocumentGroups, the received External Event must have a URL
    /// for the DocumentGroup to be considered. (Either via openURL, or
    /// the webPageURL property of an NSUserActivity). The UTI for the URL
    /// is implicitly matched against the DocumentGroup's supported types.
    ///
    /// If the modifier evaluates to true, an instance of the
    /// Scene will be used.
    ///
    /// If the modifier evaluates to false, on macOS the Scene
    /// will not be used even if no other Scenes are available.
    /// This case is considered an error. On iOS, the first Scene
    /// specified in the body property for the App will be used.
    ///
    /// If no modifier is set, the Scene will be used if all
    /// other WindowGroups with a modifier evaluate to false.
    ///
    /// On platforms that only allow a single Window/Scene, this method is
    /// ignored.
    ///
    /// - Parameter matching: A Set of Strings that are checked to see
    /// if they are contained in the targetContentIdenfifier. The empty Set
    /// and empty Strings never match. The String value "*" always matches.
    public func handlesExternalEvents(matching conditions: Set<String>) -> some Scene {
        modifier(ActivationConditionsModifier(conditions: conditions))
    }
}

@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {

    /// Sets the style for menu bar extra created by this scene.
    public func menuBarExtraStyle<S>(_ style: S) -> some Scene where S : MenuBarExtraStyle {
        modifier(MenuBarExtraStyleModifier(style: style))
    }
}

extension Scene {
    /// Sets the style for windows created by this scene.
    public func windowStyle<S>(_ style: S) -> some Scene where S : WindowStyle {
        modifier(WindowStyleModifier(style: style))
    }

    /// Sets the style for the toolbar defined within this scene.
    public func windowToolbarStyle<S>(_ style: S) -> some Scene where S : WindowToolbarStyle {
        modifier(WindowToolbarStyleModifier(style: style))
    }
}

extension Scene {

    /// Sets a default size for a window.
    ///
    /// Use this scene modifier to indicate a default initial size for a new
    /// window that the system creates from a ``Scene`` declaration. For
    /// example, you can request that new windows that a ``WindowGroup``
    /// generates occupy 600 points in the x-dimension and 400 points in
    /// the y-dimension:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             .defaultSize(CGSize(width: 600, height: 400))
    ///         }
    ///     }
    ///
    /// The size that you specify acts only as a default for when the window
    /// first appears. People can later resize the window using interface
    /// controls that the system provides. Also, during state restoration,
    /// the system restores windows to their most recent size rather than
    /// the default size.
    ///
    /// If you specify a default size that's outside the range of the window's
    /// inherent resizability in one or both dimensions, the system clamps the
    /// affected dimension to keep it in range. You can configure the
    /// resizability of a scene using the ``Scene/windowResizability(_:)``
    /// modifier.
    ///
    /// The default size modifier affects any scene type that creates windows
    /// in macOS, namely:
    ///
    ///  * ``WindowGroup``
    ///  * ``Window``
    ///  * ``DocumentGroup``
    ///  * ``Settings``
    ///
    /// If you want to specify the input directly in terms of width and height,
    /// use ``Scene/defaultSize(width:height:)`` instead.
    ///
    /// - Parameter size: The default size for new windows created from a scene.
    ///
    /// - Returns: A scene that uses a default size for new windows.
    public func defaultSize(_ size: Size) -> some Scene {
        modifier(WindowDefaultsSizeModifier(width: size.width, height: size.height))
    }


    /// Sets a default width and height for a window.
    ///
    /// Use this scene modifier to indicate a default initial size for a new
    /// window that the system creates from a ``Scene`` declaration. For
    /// example, you can request that new windows that a ``WindowGroup``
    /// generates occupy 600 points in the x-dimension and 400 points in
    /// the y-dimension:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             .defaultSize(width: 600, height: 400)
    ///         }
    ///     }
    ///
    /// The size that you specify acts only as a default for when the window
    /// first appears. People can later resize the window using interface
    /// controls that the system provides. Also, during state restoration,
    /// the system restores windows to their most recent size rather than
    /// the default size.
    ///
    /// If you specify a default size that's outside the range of the window's
    /// inherent resizability in one or both dimensions, the system clamps the
    /// affected dimension to keep it in range. You can configure the
    /// resizability of a scene using the ``Scene/windowResizability(_:)``
    /// modifier.
    ///
    /// The default size modifier affects any scene type that creates windows
    /// in macOS, namely:
    ///
    ///  * ``WindowGroup``
    ///  * ``Window``
    ///  * ``DocumentGroup``
    ///  * ``Settings``
    ///
    /// If you want to specify the size input in terms of size instance,
    /// use ``Scene/defaultSize(_:)-5y8n`` instead.
    ///
    /// - Parameter width: The default width for windows created from a scene.
    /// - Parameter height: The default height for windows created from a scene.
    ///
    /// - Returns: A scene that uses a default size for new windows.
    public func defaultSize(_ width: Float, _ height: Float) -> some Scene {
        modifier(WindowDefaultsSizeModifier(width: width, height: height))
    }
}

extension Scene {

    /// Sets a default position for a window.
    ///
    /// The first time your app opens a window from a particular scene
    /// declaration, the system places the window at the center of the screen by
    /// default. For scene types that support multiple simultaneous windows, the
    /// system offsets each additional window by a small amount to avoid
    /// completely obscuring existing windows.
    ///
    /// You can override the default placement of the first window by
    /// applying a scene modifier that indicates where to place the window
    /// relative to the screen bounds. For example, you can request that the
    /// system place a new window in the bottom trailing corner of the screen:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             .defaultPosition(.bottomTrailing)
    ///         }
    ///     }
    ///
    /// The system aligns the point in the window that corresponds to the
    /// specified ``UnitPoint`` with the point in the screen that corresponds
    /// to the same unit point.
    ///
    /// You typically use one of the predefined unit points --- like
    /// ``UnitPoint/bottomTrailing`` in the above example --- but
    /// you can also use a custom unit point. For example, the following
    /// modifier aligns the point that's one quarter of the way from the
    /// leading edge of the window with the point that's one quarter of
    /// the way from the leading edge of the screen, while centering the
    /// window in the y-dimension:
    ///
    ///     WindowGroup {
    ///         ContentView()
    ///     }
    ///     .defaultPosition(UnitPoint(x: 0.25, y: 0.5))
    ///
    /// The modifier affects any scene type that creates windows in macOS,
    /// namely:
    ///
    ///  * ``WindowGroup``
    ///  * ``Window``
    ///  * ``DocumentGroup``
    ///  * ``Settings``
    ///
    /// The value that you provide acts only as an initial default. During state
    /// restoration, the system restores the window to the position that it
    /// last occupied.
    ///
    /// - Parameter position: A ``UnitPoint`` that specifies where to place a
    ///   newly opened window relative to the screen bounds.
    ///
    /// - Returns: A scene that uses a default position for new windows.
    public func defaultPosition(_ position: UnitPoint) -> some Scene {
        modifier(WindowDefaultsPositionModifier(position))
    }
}

extension Scene {

    /// Adds commands to the scene.
    ///
    /// Commands are realized in different ways on different platforms. On
    /// macOS, the main menu uses the available command menus and groups to
    /// organize its main menu items. Each menu is represented as a top-level
    /// menu bar menu, and each command group has a corresponding set of menu
    /// items in one of the top-level menus, delimited by separator menu items.
    ///
    /// On iPadOS, commands with keyboard shortcuts are exposed in the shortcut
    /// discoverability HUD that users see when they hold down the Command (⌘)
    /// key.
    public func commands<Content>(@CommandsBuilder content: () -> Content) -> some Scene where Content : Commands {
        modifier(CommandsModifier(content: content()))
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {

    /// Sets the kind of resizability to use for a window.
    ///
    /// Use this scene modifier to apply a value of type ``WindowResizability``
    /// to a ``Scene`` that you define in your ``App`` declaration.
    /// The value that you specify indicates the strategy the system uses to
    /// place minimum and maximum size restrictions on windows that it creates
    /// from that scene.
    ///
    /// For example, you can create a window group that people can resize to
    /// between 100 and 400 points in both dimensions by applying both a frame
    /// with those constraints to the scene's content, and the
    /// ``WindowResizability/contentSize`` resizability to the scene:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///                     .frame(
    ///                         minWidth: 100, maxWidth: 400,
    ///                         minHeight: 100, maxHeight: 400)
    ///             }
    ///             .windowResizability(.contentSize)
    ///         }
    ///     }
    ///
    /// The default value for all scenes if you don't apply the modifier is
    /// ``WindowResizability/automatic``. With that strategy, ``Settings``
    /// windows use the ``WindowResizability/contentSize`` strategy, while
    /// all others use ``WindowResizability/contentMinSize``.
    ///
    /// - Parameter resizability: The resizability to use for windows created by
    ///   this scene.
    ///
    /// - Returns: A scene that uses the specified resizability strategy.
    public func windowResizability(_ resizability: WindowResizability) -> some Scene {
        modifier(WindowResizabilityModifier(resizability: resizability))
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {

    /// Removes all commands defined by the modified scene.
    ///
    /// `WindowGroup`, `Window`, and other scene types all have an associated
    /// set of commands that they include by default. Apply this modifier to a
    /// scene to exclude those commands.
    ///
    /// For example, the following code adds a scene for presenting the details
    /// of an individual data model in a separate window. To ensure that the
    /// window can only appear programmatically, we remove the scene's commands,
    /// including File > New Note Window.
    ///
    ///     @main
    ///     struct Example: App {
    ///         var body: some Scene {
    ///             ...
    ///
    ///             WindowGroup("Note", id: "note", for: Note.ID.self) {
    ///                 NoteDetailView(id: $0)
    ///             }
    ///             .commandsRemoved()
    ///         }
    ///     }
    ///
    /// - Returns: A scene that excludes any commands defined by its children.
    public func commandsRemoved() -> some Scene {
        modifier(CommandsRemovedModifier())
    }


    /// Replaces all commands defined by the modified scene with the commands
    /// from the builder.
    ///
    /// `WindowGroup`, `Window`, and other scene types all have an associated
    /// set of commands that they include by default. Apply this modifier to a
    /// scene to replace those commands with the output from the given builder.
    ///
    /// For example, the following code adds a scene for showing the contents of
    /// the pasteboard in a dedicated window. We replace the scene's default
    /// Window > Clipboard menu command with a custom Edit > Show Clipboard
    /// command that we place next to the other pasteboard commands.
    ///
    ///     @main
    ///     struct Example: App {
    ///         @Environment(\.openWindow) var openWindow
    ///
    ///         var body: some Scene {
    ///             ...
    ///
    ///             Window("Clipboard", id: "clipboard") {
    ///                 ClipboardContentView()
    ///             }
    ///             .commandsReplaced {
    ///                 CommandGroup(after: .pasteboard) {
    ///                     Section {
    ///                         Button("Show Clipboard") {
    ///                             openWindow(id: "clipboard")
    ///                         }
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - content: A `Commands` builder whose output will be used to replace
    ///     the commands normally provided by the modified scene.
    ///
    /// - Returns: A scene that replaces any commands defined by its children
    ///   with alternative content.
    public func commandsReplaced<Content>(@CommandsBuilder content: () -> Content) -> some Scene where Content : Commands {
        modifier(CommandsRemovedModifier())
    }
}

extension Scene {

    /// Runs the specified action when the system provides a background task.
    ///
    /// When the system wakes your app or extension for one or more background
    /// tasks, it will call any actions associated with matching tasks. When
    /// your async actions return, the system put your app back into a suspended
    /// state. The system considers the task completed when the action closure
    /// that you provide returns. If the action closure has not returned when
    /// the task runs out of time to complete, the system cancels the task. Use
    /// <doc://com.apple.documentation/documentation/Swift/withTaskCancellationHandler(operation:onCancel:)>
    /// to observe whether the task is low on runtime.
    ///
    ///     /// An example of a Weather Application.
    ///     struct WeatherApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 Text("Responds to App Refresh")
    ///             }
    ///             .backgroundTask(.appRefresh("WEATHER_DATA")) {
    ///                 await updateWeatherData()
    ///             }
    ///         }
    ///         func updateWeatherData() async {
    ///             // fetches new weather data and updates app state
    ///         }
    ///     }
    ///
    ///
    /// - Parameters:
    ///   - task: The type of task with which to associate the provided action.
    ///   - action: An async closure that the system runs for the specified task
    ///     type.
    public func backgroundTask<D, R>(_ task: BackgroundTask<D, R>, action: @escaping @Sendable (D) async -> R) -> some Scene where D : Sendable, R : Sendable {
        modifier(BackgroundTaskModifier(task: task, storage: action))
    }
}

extension Scene {

    /// Transforms the environment value of the specified key path with the
    /// given function.
    public func transformEnvironment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, transform: @escaping (inout V) -> Void) -> some Scene {
        modifier(_EnvironmentKeyTransformModifier(keyPath: keyPath, transform: transform))
    }

}

extension ModifiedContent : Scene where Content : Scene, Modifier : _SceneModifier {

    // MARK: - Property(ies).
    
    public var body : Never { fatalError() }
    
    // MARK: - Static Function(s).

    public static func _makeScene(scene: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _SceneInputs) -> _SceneOutputs {
        let modified = Modifier._makeScene(modifier: .init(scene.value.modifier), inputs: inputs) { _, _ in
            _SceneOutputs()
        }
        let inputs = inputs
        let content = Content._makeScene(scene: .init(scene.value.content), inputs: modified + inputs)

        return modified + content
    }
}

extension ModifiedContent : _SceneModifier where Content : _SceneModifier, Modifier : _SceneModifier {
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> Never {
        fatalError()
    }
    
    // MARK: - Static Function(s).
    
    public static func _makeScene(modifier: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        let m1 = Content._makeScene(modifier: .init(modifier.value.content), inputs: inputs) { _, _ in
            _SceneOutputs()
        }
        
        let inputs = inputs
        let m2 = Modifier._makeScene(modifier: .init(modifier.value.modifier), inputs: m1 + inputs) { _, _ in
            _SceneOutputs()
        }
        
        return m1 + m2
    }
}

extension ModifiedContent where Content : Scene {
    public static func _makeScene(scene: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _SceneInputs) -> _SceneOutputs {
        Content.Body._makeScene(scene: .init(scene.value.content.body), inputs: inputs)
    }
}
