//
// Scene.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenCombine
import OpenSpatial

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
/// `MyRootView` on platforms like Windows and iPadOS. On other platforms, the
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
///
/// A type conforming to this protocol inherits `@preconcurrency @MainActor`
/// isolation from the protocol if the conformance is included in the type's
/// base declaration:
///
///     struct MyCustomType: Transition {
///         // `@preconcurrency @MainActor` isolation by default
///     }
///
/// Isolation to the main actor is the default, but it's not required. Declare
/// the conformance in an extension to opt out of main actor isolation:
///
///     extension MyCustomType: Transition {
///         // `nonisolated` by default
///     }
///
@MainActor @preconcurrency public protocol Scene {

    // MARK: - Creating a scene

    /// The type of scene that represents the body of this scene.
    ///
    /// When you create a custom scene, Swift infers this type from your
    /// implementation of the required ``OpenSwiftUI/Scene/body-swift.property``
    /// property.
    associatedtype Body : Scene

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from built-in scenes that OpenSwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``OpenSwiftUI/Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    @SceneBuilder @MainActor @preconcurrency var body: Self.Body { get }

    /// Creates the scene's representation in the OpenSwiftUI scene graph.
    ///
    /// - Parameters:
    ///   - scene: The scene to create.
    ///   - inputs: The inputs for the scene.
    @MainActor @preconcurrency static func _makeScene(scene: _GraphValue<Self>, inputs: _SceneInputs) -> _SceneOutputs
}

extension Scene {

    // MARK: - Watching for changes

    /// Adds an action to perform when the given value changes.
    ///
    /// Use this modifier to trigger a side effect when a value changes, like
    /// the value associated with an ``OpenSwiftUI/Environment`` key or a
    /// ``OpenSwiftUI/Binding``. For example, you can clear a cache when you notice
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
        modifier(
            _ValueActionModifier2(
                value: value, 
                action: action
            )
        )
    }

    /// Adds an action to perform when the given value changes.
    ///
    /// Use this modifier to trigger a side effect when a value changes, like
    /// the value associated with an ``OpenSwiftUI/Environment`` key or a
    /// ``OpenSwiftUI/Binding``. For example, you can clear a cache when you notice
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
        modifier(
            _ValueActionModifier2(
                value: value, 
                action: action
            )
        )
    }

    /// Specifies the external events for which OpenSwiftUI opens a new instance
    /// of the modified scene.
    ///
    /// When your app receives an external event like a user activity or a
    /// URL, OpenSwiftUI routes the event to a scene for processing. OpenSwiftUI
    /// selects the scene that receives the event according to the following
    /// rules, which it evaluates in order until it finds a destination scene:
    ///
    /// * On platforms that support only a single scene per app, send
    ///   the event to the one open scene.
    /// * Find an open scene that indicates it prefers to or can handle the
    ///   event, if any, and send the event to that scene. You use the
    ///   ``View/handlesExternalEvents(preferring:allowing:)`` view modifier
    ///   on a view inside the scene to register this preference.
    /// * Find a scene declaration with a `handlesExternalEvents(matching:)`
    ///   scene modifier containing `conditions` that match the external event.
    ///   Create a new instance of the first scene that matches and route the
    ///   event there.
    /// * Find the first scene declaration that doesn't have the scene modifier.
    ///   Create a new instance of this scene and route the event there.
    ///
    /// Make sure that at least one of these rules succeeds in your app for all
    /// events that your app claims to handle. Also, make sure
    /// that the scene that receives an event actually handles it. For example,
    /// be sure that a scene that receives user activities handles them with an
    /// appropriate ``View/onContinueUserActivity(_:perform:)`` view modifier.
    ///
    /// Don't confuse the `handlesExternalEvents(matching:)` scene
    /// modifier with the ``View/handlesExternalEvents(preferring:allowing:)``
    /// _view_ modifier. You use the scene modifier to help OpenSwiftUI choose a
    /// new scene to open when no open scene handles an external event,
    /// whereas you use the view modifier to indicate that an open scene can
    /// or prefers to handle certain events.
    ///
    /// ### Matching an event
    ///
    /// To find a scene type that handles a particular external event, OpenSwiftUI
    /// compares a property of the event against the strings that you specify
    /// in the `conditions` set. OpenSwiftUI examines the following event
    /// properties to perform the comparison:
    ///
    /// * For an
    ///   <doc://com.apple.documentation/documentation/Foundation/NSUserActivity>,
    ///   like when your app handles Handoff, OpenSwiftUI uses the activity's
    ///   <doc://com.apple.documentation/documentation/Foundation/NSUserActivity/3238062-targetContentIdentifier>
    ///   property, or if that's `nil`, its
    ///   <doc://com.apple.documentation/documentation/Foundation/NSUserActivity/1418086-webpageurl>
    ///   property rendered as an
    ///   <doc://com.apple.documentation/documentation/Foundation/URL/1779984-absoluteString>.
    /// * For a
    ///   <doc://com.apple.documentation/documentation/Foundation/URL>,
    ///   like when another process opens a URL that your app handles,
    ///   OpenSwiftUI uses the URL's
    ///   <doc://com.apple.documentation/documentation/Foundation/URL/1779984-absoluteString>.
    ///
    /// An empty set of strings never matches. Similarly, empty strings never
    /// match. Conversely, as a special case, the string that contains only an
    /// asterisk (`*`) matches anything. The modifier performs string
    /// comparisons that are case and diacritic insensitive.
    ///
    /// > Important: ``DocumentGroup`` scenes ignore this modifier. Instead,
    ///   document scenes decide whether to open a new scene to handle an
    ///   external event by comparing the incoming URL or user activity's
    ///   <doc://com.apple.documentation/documentation/Foundation/NSUserActivity/1418086-webpageurl>
    ///   against the document group's supported types.
    ///
    /// ### Choosing a window to open
    ///
    /// The following example shows an app with a photo browser scene
    /// that displays a collection of photos, and a photo detail scene that
    /// enables closer examination of a particular photo:
    ///
    ///     @main
    ///     struct MyPhotos: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 PhotosBrowser()
    ///             }
    ///
    ///             WindowGroup("Photo") {
    ///                 PhotoDetail()
    ///             }
    ///             .handlesExternalEvents(matching: ["photoIdentifier="])
    ///         }
    ///     }
    ///
    /// The app uses the `handlesExternalEvents(matching:)` modifier on the
    /// second scene to ensure that an external event with an identifier
    /// that contains the string `photoIdentifier=` creates a new scene of
    /// the second type. Other events, if not handled by an open scene,
    /// cause the creation of a new browser window instead.
    ///
    /// - Parameter conditions: A set of strings that OpenSwiftUI compares against
    ///   the incoming user activity or URL to see if OpenSwiftUI
    ///   can open a new scene instance to handle the external event.
    ///
    /// - Returns: A scene type that limits the kinds of external events for
    ///   which OpenSwiftUI opens a new instance.
    public func handlesExternalEvents(matching conditions: Set<String>) -> some Scene {
        modifier(
            ActivationConditionsModifier(
                conditions: conditions
            )
        )
    }
}

extension Scene {

    // MARK: - Creating background tasks

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
        modifier(
            BackgroundTaskModifier(
                task: task, 
                storage: action
            )
        )
    }
}

extension Scene {

    // MARK: - Managing app storage

    // The default store used by `AppStorage` contained within the view.
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

extension Scene {

    // MARK: - Settings commands

    /// Adds commands to the scene.
    ///
    /// Commands are realized in different ways on different platforms. On
    /// Windows, the main menu uses the available command menus and groups to
    /// organize its main menu items. Each menu is represented as a top-level
    /// menu bar menu, and each command group has a corresponding set of menu
    /// items in one of the top-level menus, delimited by separator menu items.
    ///
    /// On iPadOS, commands with keyboard shortcuts are exposed in the shortcut
    /// discoverability HUD that users see when they hold down the Command (⌘)
    /// key.
    public func commands<Content>(@CommandsBuilder content: () -> Content) -> some Scene where Content : Commands {
        modifier(CommandsModifier(value: content()))
    }

    // Removes all commands defined by the modified scene.
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
        modifier(
            CommandsModifier(
                value: content()
            )
        )
    }

    /// Defines a keyboard shortcut for opening new scene windows.
    ///
    /// A scene's keyboard shortcut is bound to the command it adds for creating
    /// new windows (in the case of `WindowGroup` and `DocumentGroup`) or
    /// bringing a singleton window forward (in the case of `Window` and, on
    /// Windows, `Settings`). Pressing the keyboard shortcut is equivalent to
    /// selecting the menu command.
    ///
    /// In cases where a command already has a keyboard shortcut, the scene's
    /// keyboard shortcut is used instead. For example, `WindowGroup` normally
    /// creates a File > New Window menu command whose keyboard shortcut is
    /// `⌘N`. The following code changes it to `⌥⌘N`:
    ///
    ///     WindowGroup {
    ///         ContentView()
    ///     }
    ///     .keyboardShortcut("n", modifiers: [.option, .command])
    ///
    /// ### Localization
    ///
    /// Provide a `localization` value to specify how this shortcut
    /// should be localized.
    ///
    /// Given that `key` is always defined in relation to the US-English
    /// keyboard layout, it might be hard to reach on different international
    /// layouts. For example the shortcut `⌘[` works well for the
    /// US layout but is hard to reach for German users, where
    /// `[` is available by pressing `⌥5`, making users type `⌥⌘5`.
    /// The automatic keyboard shortcut remapping re-assigns the shortcut to
    /// an appropriate replacement, `⌘Ö` in this case.
    ///
    /// Providing the option
    /// ``KeyboardShortcut/Localization-swift.struct/custom``
    /// disables the automatic localization for this shortcut to tell the system
    /// that internationalization is taken care of in a different way.
    ///
    /// - Parameters:
    ///   - key: The key equivalent the user presses to present the scene.
    ///   - modifiers: The modifier keys required to perform the shortcut.
    ///   - localization: The localization style to apply to the shortcut.
    /// - Returns: A scene that can be presented with a keyboard shortcut.
    public func keyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command, localization: KeyboardShortcut.Localization = .automatic) -> some Scene {
        modifier(
            _PreferenceTransformModifier(
                key: KeyboardShortcut(
                    key, 
                    modifiers: modifiers, 
                    localization: localization
                )
            )
        )
    }

    /// Defines a keyboard shortcut for opening new scene windows.
    ///
    /// A scene's keyboard shortcut is bound to the command it adds for creating
    /// new windows (in the case of `WindowGroup` and `DocumentGroup`) or
    /// bringing a singleton window forward (in the case of `Window` and, on
    /// Windows, `Settings` and `UtilityWindow`). Pressing the keyboard shortcut
    /// is equivalent to selecting the menu command.
    ///
    /// In cases where a command already has a keyboard shortcut, the scene's
    /// keyboard shortcut is used instead. For example, `WindowGroup` normally
    /// creates a File > New Window menu command whose keyboard shortcut is
    /// `⌘N`. The following code changes it to something based on dynamic state:
    ///
    ///     @main
    ///     struct Notes: App {
    ///         @State private var newWindowShortcut: KeyboardShortcut? = ...
    ///
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView($newWindowShortcut)
    ///             }
    ///             .keyboardShortcut(newWindowShortcut)
    ///         }
    ///     }
    ///
    /// If `shortcut` is `nil`, the scene's presentation command will not be
    /// associated with a keyboard shortcut, even if OpenSwiftUI normally assigns
    /// one automatically.
    ///
    /// - Parameters:
    ///   - shortcut: The keyboard shortcut for presenting the scene, or `nil`.
    /// - Returns: A scene that can be presented with a keyboard shortcut.
    public func keyboardShortcut(_ shortcut: KeyboardShortcut?) -> some Scene {
        modifier(
            _PreferenceTransformModifier(
                key: shortcut
            )
        )
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
    /// The modifier affects any scene type that creates windows in Windows,
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
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.defaultScenePosition] = position
            })
        )
    }

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
    /// in Windows, namely:
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
    public func defaultSize(_ size: Size3D) -> some Scene {
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.defaultSceneSize] = size
            })
        )
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
    /// in Windows, namely:
    ///
    ///  * ``WindowGroup``
    ///  * ``Window``
    ///  * ``DocumentGroup``
    ///  * ``Settings``
    ///
    /// If you want to specify the size input in terms of size instance,
    /// use ``Scene/defaultSize(_:)`` instead.
    ///
    /// - Parameter width: The default width for windows created from a scene.
    /// - Parameter height: The default height for windows created from a scene.
    /// - Parameter depth: The default depth for the created volumetric window.
    ///
    /// - Returns: A scene that uses a default size for new windows.
    public func defaultSize(_ width: Double, _ height: Double, _ depth: Double = 0) -> some Scene {
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.defaultSceneSize] = .init(
                        width: width, 
                        height: height, 
                        depth: depth
                    )
            })
        )
    }

    /// Defines a function used for determining the default placement
    /// of windows.
    ///
    /// Use this scene modifier to indicate a default initial size and position
    /// for a new window that the system creates from a ``Scene`` declaration.
    ///
    /// On Windows, you can use the screen's bounds to place the window.
    /// For example, you can specify that the window is always placed 140
    /// points from the bottom of the screen:
    ///
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             ...
    ///
    ///             Window("Status", id: "status") {
    ///                 StatusView()
    ///             }
    ///             .windowResizability(.contentSize)
    ///             .defaultWindowPlacement { content, context in
    ///                 let displayBounds = context.defaultDisplay.visibleRect
    ///                 let size = content.sizeThatFits(.unspecified)
    ///                 let position = CGPoint(
    ///                     x: displayBounds.midX - (size.width / 2),
    ///                     y: displayBounds.maxY - size.height - 140)
    ///                 return WindowPlacement(position: position, size: size)
    ///             }
    ///         }
    ///     }
    ///
    /// On visionOS, the system always places the first window
    /// relative to where the person is looking.
    /// The system ignores calls to `defaultWindowPlacement(_:)`.
    ///
    /// You can place any subsequent windows relative to existing ones by
    /// returning one of the methods defined by ``WindowPlacement/Position``
    /// with the existing window.
    /// For example, you can align the new window with the trailing edge of
    /// the `Content` window:
    ///
    ///     struct MyApp: App {
    ///         @Environment(\.openWindow) private var openWindow
    ///
    ///         var body: some Scene {
    ///             WindowGroup("Content", id: "content") {
    ///                 Button("Open status window") {
    ///                     openWindow(id: "status")
    ///                 }
    ///             }
    ///
    ///             WindowGroup("Status", id: "status") {
    ///                 StatusView()
    ///             }
    ///             .windowResizability(.contentSize)
    ///             .defaultWindowPlacement { content, context in
    ///                 if let contentWindow = context.windows.first(
    ///                 where: { $0.id == "content" }) {
    ///                     WindowPlacement(.trailing(contentWindow))
    ///                 } else {
    ///                     WindowPlacement()
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// The placement that your function returns acts as a default for when the
    /// window first appears. People can later resize and move the window using
    /// interface controls that the system provides. Also, during state
    /// restoration, the system restores the window to it's most recent size and
    /// position, rather than the default placement.
    ///
    /// For more information on configuring how scenes behave with
    /// state restoration, see ``Scene.stateRestoration(_:)``.
    ///
    /// - Parameters:
    ///   - makePlacement: A closure to generate the default window placement.
    ///   - content: A proxy for the contents of the window.
    ///   - context: An instance of a ``WindowPlacementContext`` that provides
    ///     contextual information used to size and position windows.
    public func defaultWindowPlacement(_ makePlacement: @escaping (_ content: WindowLayoutRoot, _ context: WindowPlacementContext) -> WindowPlacement) -> some Scene {
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.defaultSceneWindowPlacement] = makePlacement
            })
        )
    }

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
        modifier(
            WindowResizabilityModifier(
                resizability: resizability
            )
        )
    }

    /// Specifies how windows derived form this scene should determine their
    /// size when zooming.
    ///
    /// The default behavior will size the window to its maximum size, or the
    /// bounds of the display, whichever is smaller. By overriding this
    /// behavior, you can provide a size that is appropriate for the contents
    /// of your window.
    ///
    /// For example, you can define a window group where the window has an ideal
    /// width of 800 points and an ideal height of 600 points:
    ///
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///                     .frame(idealWidth: 800, idealHeight: 600)
    ///             }
    ///             .windowIdealSize(.fitToContent)
    ///         }
    ///     }
    ///
    /// - Parameter idealSize: A value which determines how windows derived from
    ///   this scene should size themselves when zooming.
    public func windowIdealSize(_ idealSize: WindowIdealSize) -> some Scene {
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.defaultSceneIdealSize] = idealSize
            })
        )
    }

    /// Provides a function which determines a placement to use when windows
    /// of a scene zoom.
    ///
    /// The default behavior will size the window to its maximum size, or the
    /// bounds of the display, whichever is smaller. By overriding this
    /// behavior, you can provide a size that is appropriate for the contents
    /// of your window.
    ///
    /// For example, you can provide a placement with a height equal to
    /// the display bounds, and a width based on your content's ideal width:
    ///
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             .windowIdealPlacement { content, context in
    ///                 let displayBounds = context.defaultDisplay.visibleRect
    ///                 let proposal = ProposedViewSize(
    ///                     width: nil, height: displayBounds.height)
    ///                 let contentSize = content.sizeThatFits(proposal)
    ///                 return .init(
    ///                     width: contentSize.width,
    ///                     height: contentSize.height)
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - makePlacement: A closure which returns the ideal placement for a
    ///     window derived from this scene.
    ///   - content: A proxy for the root content of the window.
    ///   - context: An instance of a ``WindowPlacementContext`` that provides
    ///     contextual information used to size and position windows.
    public func windowIdealPlacement(_ makePlacement: @escaping (_ content: WindowLayoutRoot, _ context: WindowPlacementContext) -> WindowPlacement) -> some Scene {
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.defaultSceneWindowIdealPlacement] = makePlacement
            })
        )
    }

    /// Configures the role for windows derived from `self` when
    /// participating in a managed window context, such as full screen or
    /// Stage Manager.
    ///
    /// By default, the type of `Scene` and its placement within the app's
    /// definition will determine the behavior of its windows within a window
    /// management context.
    ///
    /// You can use this modifier to override the default behaivor.
    ///
    /// For example, you can specify that a secondary `Window` scene should use
    /// the principal behavior for full screen and Stage Manager:
    ///
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             Window("Organizer", id: "organizer") {
    ///                 OrganizerView()
    ///             }
    ///             .windowManagerRole(.principal)
    ///         }
    ///     }
    ///
    public func windowManagerRole(_ role: WindowManagerRole) -> some Scene {
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.windowManagerRole] = role
            })
        )
    }
}

extension Scene {

    // MARK: - Configuring scene visibility

    /// Sets the default launch behavior for this scene.
    ///
    /// This behavior can be used to define if a scene is shown on application
    /// launch in the absence of any previously saved state.
    ///
    /// On platforms that do not support multiple windows, this value is
    /// ignored.
    ///
    /// On platforms other than Windows, there must be at least one scene that
    /// presents itself. If no scenes are defined to present, the first scene
    /// will be presented, regardless of the value provided to this modifier.
    ///
    /// - Note: During app launch, on platforms other than Windows, the system
    ///   will only consider scenes whose role matches the
    ///   <doc://com.apple.documentation/documentation/bundleresources/information_property_list/uiapplicationpreferreddefaultscenesessionrole>
    ///   key in the application scene manifest of the `Info.plist` file.
    ///   For instance, a volumetric window would need the
    ///   `UIWindowSceneSessionRoleVolumetricApplication` role.
    ///
    /// On Windows, this behavior will also be used to determine which scene is
    /// presented when clicking on the icon of a running application with no
    /// visible windows.
    ///
    /// On visionOS, the system may background the last dismissed scene instead
    /// of closing it. Thus, the suppressed behavior additionally specifies that
    /// the scene should not be presented when tapping on the application icon
    /// with no visible windows.
    ///
    /// For example, you may wish to present a welcome window on launch of your
    /// app when there are no previous document windows being restored:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             DocumentGroup(newDocument: MyDocument()) { configuration in
    ///                 DocumentEditor(configuration.$document)
    ///             }
    ///
    ///             Window("Welcome to My App", id: "welcome") {
    ///                 WelcomeView()
    ///             }
    ///             .defaultLaunchBehavior(.presented)
    ///         }
    ///     }
    ///
    /// The default value for all scenes if you do not apply this modifier is
    /// ``SceneLaunchBehavior/automatic``. With that strategy, a scene
    /// will only present itself if it is the first scene defined by the app,
    /// and no other scenes have presented themselves.
    public func defaultLaunchBehavior(_ behavior: SceneLaunchBehavior) -> some Scene {
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.sceneLaunchBehavior] = behavior
            })
        )
    }

    /// Sets the restoration behavior for this scene.
    ///
    /// Use this scene modifier to apply a value of this type to a ``Scene`` you
    /// define in your ``App`` declaration. The value you specify determines how
    /// the system will restore windows from a previous run of your application.
    ///
    /// For example, you may have a scene that you do not wish to be restored on
    /// launch:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             Window(id: "network-test", "Network Connection Test") {
    ///                 NetworkTestView()
    ///             }
    ///             .restorationBehavior(.disabled)
    ///         }
    ///     }
    ///
    /// The default value for all scenes if you do not apply the modifier is
    /// ``SceneRestorationBehavior/automatic``. With that strategy, scenes will
    /// restore themselves depending on the default behavior for the platform.
    public func restorationBehavior(_ behavior: SceneRestorationBehavior) -> some Scene {
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.sceneRestorationBehavior] = behavior
            })
        )
    }

    // Sets the preferred visibility of the non-transient system views
    /// overlaying the app.
    ///
    /// Use this modifier to influence the appearance of system overlays
    /// in your app. The behavior varies by platform.
    ///
    /// In iOS, the following example hides every persistent system overlay.
    /// In visionOS 2 and later, the SharePlay Indicator hides if the
    /// scene is shared through SharePlay, or not shared at all.
    /// During screen sharing, the indicator always remains visible.
    /// The Home indicator doesn't appear without specific user intent
    /// when you set visibility to ``hidden``. For a ``WindowGroup``,
    /// the modifier affects the visibility of the window chrome. For an
    /// ``ImmersiveSpace``, it affects the Home indicator.
    ///
    ///     struct ImmersiveView: View {
    ///         var body: some View {
    ///             Text("Maximum immersion")
    ///                 .persistentSystemOverlays(.hidden)
    ///         }
    ///     }
    ///
    /// > Note: You can indicate a preference with this modifier, but the system
    /// might or might not be able to honor that preference.
    ///
    /// Affected non-transient system views can include, but are not limited to:
    /// - The Home indicator.
    /// - The SharePlay indicator.
    /// - The Multitasking Controls button and Picture in Picture on iPad.
    ///
    /// - Parameter visibility: A value that indicates the visibility of the
    /// non-transient system views overlaying the app.
    public func persistentSystemOverlays(_ preferredVisibility: Visibility) -> some Scene{
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.defaultPersistentSystemOverlays] = preferredVisibility
            })
        )
    }
}

extension Scene {

    // MARK: - Styling the scene

    /// Sets the style for windows created by this scene.
    public func windowStyle<S>(_ style: S) -> some Scene where S : WindowStyle {
        modifier(
            WindowStyleModifier(
                style: style
            )
        )
    }

    /// Sets the window level of this scene.
    ///
    ///     Window("Utility Window", id: "...") {
    ///         UtilityContent()
    ///     }
    ///     .windowLevel(.floating)
    ///
    /// - Parameter level: The desired window level
    public func windowLevel(_ level: WindowLevel) -> some Scene {
        modifier(
            TransformSceneListModifier({
                Application
                    .shared
                    .globalEnvironmentValues[keyPath: \.defaulScenetWindowLevel] = level
            })
        )
    }

    /// Sets the style for the toolbar defined within this scene.
    public func windowToolbarStyle<S>(_ style: S) -> some Scene where S : WindowToolbarStyle {
        modifier(
            WindowToolbarStyleModifier(
                style: style
            )
        )
    }

    /// Sets the label style of items in a toolbar.
    ///
    /// Use this modifier to set a static ``ToolbarLabelStyle`` the toolbar should use. The style will
    /// not be configurable by the user.
    ///
    ///         @main
    ///         struct MyApp: App {
    ///             var body: some Scene {
    ///                 WindowGroup {
    ///                     ContentView()
    ///                         .toolbar(id: "browserToolbar") {
    ///                             ...
    ///                         }
    ///                 }
    ///                 .windowToolbarLabelStyle(fixed: .iconOnly)
    ///             }
    ///         }
    ///
    /// - Parameter toolbarLabelStyle: The style to apply.
    public func windowToolbarLabelStyle(fixed style: ToolbarLabelStyle) -> some Scene {
        modifier(
            WindowToolbarLabelStyleModifier(
                data: .fixed(style)
            )
        )
    }


    /// Sets the label style of items in a toolbar and enables user customization.
    ///
    /// Use this modifier to bind a ``ToolbarLabelStyle`` to ``AppStorage``.
    /// The toolbar will default to the label style specified but will also be user configurable.
    ///
    ///         @main
    ///         struct MyApp: App {
    ///             @AppStorage("ToolbarLabelStyle")
    ///             private var labelStyle: ToolbarLabelStyle = .iconOnly
    ///
    ///             var body: some Scene {
    ///                 WindowGroup {
    ///                     ContentView()
    ///                         .toolbar(id: "browserToolbar") {
    ///                             ...
    ///                         }
    ///                 }
    ///                 .windowToolbarLabelStyle($labelStyle)
    ///             }
    ///         }
    ///
    /// - Parameter toolbarLabelStyle: The label style to apply.
    public func windowToolbarLabelStyle(_ toolbarLabelStyle: Binding<ToolbarLabelStyle>) -> some Scene {
        modifier(
            WindowToolbarLabelStyleModifier(
                data: .variable(toolbarLabelStyle)
            )
        )
    }
}

extension Scene {

    // MARK - Managing the environment

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
    public func environment<T>(_ object: T?) -> some Scene where T : AnyObject, T : Observable {
        fatalError()
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
    public func environmentObject<T>(_ object: T) -> some Scene where T : OpenCombine.ObservableObject {
        fatalError()
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
    public func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> some Scene {
        modifier(
            _EnvironmentKeyWritingModifier(
                keyPath: keyPath, 
                value: value
            )
        )
    }

    /// Transforms the environment value of the specified key path with the given function.
    public func transformEnvironment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, transform: @escaping (inout V) -> Void) -> some Scene {
        modifier(
            _EnvironmentKeyTransformModifier(
                keyPath: keyPath, 
                transform: transform
            )
        )
    }
}

extension Scene {

    // MARK: - Interacting with dialogs

    /// Configures the icon used by alerts.
    ///
    /// In Windows, this icon replaces the default icon of the app.
    ///
    ///     struct MyApp: App {
    ///         @State private var isShowingDialog = false
    ///
    ///         var body: some Scene {
    ///             Window(...) {
    ///                 Button("Delete items") {
    ///                     isShowingDialog = true
    ///                 }
    ///             }
    ///
    ///             AlertScene(
    ///                 "Are you sure you want to erase these items?",
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Erase", role: .destructive) {
    ///                     // Handle item deletion.
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     // Handle cancellation
    ///                 }
    ///             }
    ///             .dialogIcon(Image(Trash.png))
    ///         }
    ///     }
    ///
    /// - Parameter icon: The custom icon to use for the alert.
    ///   Passing `nil` will use the default app icon.
    public func dialogIcon(_ icon: Image?) -> some Scene {
        modifier(
            _EnvironmentKeyWritingModifier(
                keyPath: \.dialogIcon, 
                value: icon
            )
        )
    }

    /// Sets the severity for alerts.
    ///
    /// The following example configures an alert for erasing
    /// some number of items. Since this operation is destructive and
    /// non-recoverable, a `.critical` severity is used.
    ///
    ///     struct MyApp: App {
    ///         @State private var isShowingDialog = false
    ///
    ///         var body: some Scene {
    ///             Window(...) {
    ///                 Button("Delete items") {
    ///                     isShowingDialog = true
    ///                 }
    ///             }
    ///
    ///             AlertScene(
    ///                 "Are you sure you want to erase these items?",
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Erase", role: .destructive) {
    ///                     // Handle item deletion.
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     // Handle cancellation
    ///                 }
    ///             }
    ///             .dialogSeverity(.critical)
    ///         }
    ///     }
    ///
    /// - Parameter severity: The severity to use for alerts.
    public func dialogSeverity(_ severity: DialogSeverity) -> some Scene {
        modifier(
            _EnvironmentKeyWritingModifier(
                keyPath: \.dialogSeverity, 
                value: severity
            )
        )
    }

    /// Enables user suppression of an alert with a custom suppression
    /// message.
    ///
    /// Applying dialog suppression adds a toggle to dialogs on Windows,
    /// which allows the user to request the alert not be displayed again.
    /// Typically whether a dialog is suppressed is stored in `AppStorage`
    /// and used to decide whether to present the dialog in the future.
    ///
    /// The following example configures an alert with a
    /// suppression toggle. The toggle's state is stored in `AppStorage` and
    /// used to determine whether or not to show the dialog when the
    /// "Delete Items" button is pressed.
    ///
    ///     struct MyApp: App {
    ///         @State private var isShowingDialog = false
    ///         @AppStorage("suppressEraseItemAlert")
    ///         private var suppressAlert = false
    ///
    ///         var body: some Scene {
    ///             Window(...) {
    ///                 Button("Delete items") {
    ///                     isShowingDialog = true
    ///                 }
    ///             }
    ///
    ///             AlertScene(
    ///                 "Are you sure you want to erase these items?",
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Erase", role: .destructive) {
    ///                     // Handle item deletion.
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     // Handle cancellation
    ///                 }
    ///             }
    ///             .dialogSuppressionToggle(
    ///                 "Do not ask about erasing items again",
    ///                 isSuppressed: $suppressAlert)
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - titleKey: The title of the suppression toggle in the dialog. This
    ///     parameter can be elided to use the default suppression title.
    ///   - isSuppressed: Whether the suppression toggle is on or off in the
    ///     dialog.
    public func dialogSuppressionToggle(_ titleKey: LocalizedStringKey, isSuppressed: Binding<Bool>) -> some Scene {
        fatalError("not implemented yet")
    }

    /// Enables user suppression of an alert with a custom suppression
    /// message.
    ///
    /// Applying dialog suppression adds a toggle to dialogs on Windows,
    /// which allows the user to request the alert not be displayed again.
    /// Typically whether a dialog is suppressed is stored in `AppStorage`
    /// and used to decide whether to present the dialog in the future.
    ///
    /// The following example configures an alert with a
    /// suppression toggle. The toggle's state is stored in `AppStorage` and
    /// used to determine whether or not to show the dialog when the
    /// "Delete Items" button is pressed.
    ///
    ///     struct MyApp: App {
    ///         @State private var isShowingDialog = false
    ///         @AppStorage("suppressEraseItemAlert")
    ///         private var suppressAlert = false
    ///
    ///         var body: some Scene {
    ///             Window(...) {
    ///                 Button("Delete items") {
    ///                     isShowingDialog = true
    ///                 }
    ///             }
    ///
    ///             AlertScene(
    ///                 "Are you sure you want to erase these items?",
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Erase", role: .destructive) {
    ///                     // Handle item deletion.
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     // Handle cancellation
    ///                 }
    ///             }
    ///             .dialogSuppressionToggle(
    ///                 "Do not ask about erasing items again",
    ///                 isSuppressed: $suppressAlert)
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - title: The title of the suppression toggle in the dialog. This
    ///     parameter can be elided to use the default suppression title.
    ///   - isSuppressed: Whether the suppression toggle is on or off in the
    ///     dialog.
    public func dialogSuppressionToggle<S>(_ title: S, isSuppressed: Binding<Bool>) -> some Scene where S : StringProtocol {
        fatalError("not implemented yet")
    }

    /// Enables user suppression of an alert with a custom suppression
    /// message.
    ///
    /// Applying dialog suppression adds a toggle to dialogs on Windows,
    /// which allows the user to request the alert not be displayed again.
    /// Typically whether a dialog is suppressed is stored in `AppStorage`
    /// and used to decide whether to present the dialog in the future.
    ///
    /// The following example configures an alert with a
    /// suppression toggle. The toggle's state is stored in `AppStorage` and
    /// used to determine whether or not to show the dialog when the
    /// "Delete Items" button is pressed.
    ///
    ///     struct MyApp: App {
    ///         @State private var isShowingDialog = false
    ///         @AppStorage("suppressEraseItemAlert")
    ///         private var suppressAlert = false
    ///
    ///         var body: some Scene {
    ///             Window(...) {
    ///                 Button("Delete items") {
    ///                     isShowingDialog = true
    ///                 }
    ///             }
    ///
    ///             AlertScene(
    ///                 "Are you sure you want to erase these items?",
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Erase", role: .destructive) {
    ///                     // Handle item deletion.
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     // Handle cancellation
    ///                 }
    ///             }
    ///             .dialogSuppressionToggle(
    ///                 "Do not ask about erasing items again",
    ///                 isSuppressed: $suppressAlert)
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///   - label: The label of the suppression toggle in the dialog. This
    ///     parameter can be elided to use the default suppression title.
    ///   - isSuppressed: Whether the suppression toggle is on or off in the
    ///     dialog.
    public func dialogSuppressionToggle(_ label: Text, isSuppressed: Binding<Bool>) -> some Scene {
        fatalError("not implemented yet")
    }

    /// Enables user suppression of an alert with a custom suppression
    /// message.
    ///
    /// Applying dialog suppression adds a toggle to dialogs on Windows,
    /// which allows the user to request the alert not be displayed again.
    /// Typically whether a dialog is suppressed is stored in `AppStorage`
    /// and used to decide whether to present the dialog in the future.
    ///
    /// The following example configures an alert with a
    /// suppression toggle. The toggle's state is stored in `AppStorage` and
    /// used to determine whether or not to show the dialog when the
    /// "Delete Items" button is pressed.
    ///
    ///     struct MyApp: App {
    ///         @State private var isShowingDialog = false
    ///         @AppStorage("suppressEraseItemAlert")
    ///         private var suppressAlert = false
    ///
    ///         var body: some Scene {
    ///             Window(...) {
    ///                 Button("Delete items") {
    ///                     isShowingDialog = true
    ///                 }
    ///             }
    ///
    ///             AlertScene(
    ///                 "Are you sure you want to erase these items?",
    ///                 isPresented: $isShowingDialog
    ///             ) {
    ///                 Button("Erase", role: .destructive) {
    ///                     // Handle item deletion.
    ///                 }
    ///                 Button("Cancel", role: .cancel) {
    ///                     // Handle cancellation
    ///                 }
    ///             }
    ///             .dialogSuppressionToggle(
    ///                 "Do not ask about erasing items again",
    ///                 isSuppressed: $suppressAlert)
    ///         }
    ///     }
    ///
    /// - Parameter isSuppressed: Whether the suppression toggle is on or off
    ///   in the dialog.
    public func dialogSuppressionToggle(isSuppressed: Binding<Bool>) -> some Scene {
        fatalError("not implemented yet")
    }
}

extension Scene {

    // MARK: - Instance Methods

    /// Sets the style for menu bar extra created by this scene.
    public func menuBarExtraStyle<S>(_ style: S) -> some Scene where S : MenuBarExtraStyle {
        modifier(MenuBarExtraStyleModifier(style: style))
    }
}

extension Scene {
    nonisolated package func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(content: self, modifier: modifier)
    }
}

extension Scene {
    @MainActor @preconcurrency
    public static func _makeScene(scene: _GraphValue<Self>, inputs: _SceneInputs) -> _SceneOutputs {
        guard Self.Body.self != Never.self else {
            fatalError("Unsupported scene type \(Self.self)")
        }

        return Self.Body._makeScene(scene: _GraphValue(scene.value.body), inputs: inputs)
    }
}
