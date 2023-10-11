import Swift

/// An action that presents a window.
///
/// If the targeted scene accepts data, then the value passed to the action will
/// be provided to the scene's content closure.
///
/// Use the ``EnvironmentValues/openWindow`` environment value to get the
/// instance of this structure for a given ``Environment``. Then call the
/// instance to present a window. You call the instance directly because it
/// defines a ``OpenWindowAction/callAsFunction(id:)`` method that Swift calls
/// when you call the instance.
///
/// For example, you can define a button that opens the specified note item
/// in a new window:
///
///     @main
///     struct Notes: App {
///         var body: some Scene {
///             WindowGroup(for: Note.ID.self) { $noteID in
///                 // ...
///             }
///         }
///     }
///
///     struct NewNoteWindow: View {
///         var note: Note
///         @Environment(\.openWindow) private var openWindow
///
///         var body: some View {
///             Button("Open Note In New Window") {
///                 openWindow(value: note.id)
///             }
///         }
///     }
///
/// For best performance, use lightweight data for the presentation value.
/// For structured model values that conform to
/// <doc://com.apple.documentation/documentation/Swift/Identifiable>,
/// the value's identifier makes a good presentation value.
@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct OpenWindowAction {

    /// Presents a window for the ``WindowGroup`` scene that handles the type of
    /// the presented value.
    ///
    /// If there exists a window in the group whose presented value matches the
    /// provided value, the system brings it to the front. If not, it creates a
    /// new window and passes a binding to the provided value to its root view.
    ///
    /// For best performance, use lightweight data for the presentation value.
    /// For structured model values that conform to
    /// <doc://com.apple.documentation/documentation/Swift/Identifiable>,
    /// the value's identifier makes a good presentation value.
    ///
    /// - Parameter value: The value to present.
    public func callAsFunction<D>(value: D) where D : Decodable, D : Encodable, D : Hashable {
        fatalError()
    }

    /// Presents a window for the scene with the specified identifier.
    ///
    /// If the scene is a ``WindowGroup``, the system creates a new window for
    /// the group. If the window group presents data, the system provies the
    /// default value or `nil` to the the window's root view.
    ///
    /// If the scene is a ``Window``, the system orders its window to the front.
    ///
    /// - Parameter id: The identifier of the scene to present.
    public func callAsFunction(id: String) {
        fatalError()
    }

    /// Presents a window for the `WindowGroup` scene with the specified
    /// identifier, that handles the type of the presented value.
    ///
    /// If there exists a window in the group whose presented value matches the
    /// provided value, the system brings it to the front. If not, it creates a
    /// new window and passes a binding to the provided value to its root view.
    ///
    /// For best performance, use lightweight data for the presentation value.
    /// For structured model values that conform to
    /// <doc://com.apple.documentation/documentation/Swift/Identifiable>,
    /// the value's identifier makes a good presentation value.
    ///
    /// - Parameter id: The identifier of the scene to present.
    /// - Parameter value: The value to present.
    public func callAsFunction<D>(id: String, value: D) where D : Decodable, D : Encodable, D : Hashable {
        fatalError()
    }
}

@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    /// An action that presents a window.
    ///
    /// If the targeted scene accepts data, then the value passed to the action
    /// will be provided to the scene's content closure.
    ///
    /// Use the ``EnvironmentValues/openWindow`` environment value to get the
    /// instance of this structure for a given ``Environment``. Then call the
    /// instance to present a window. You call the instance directly because it
    /// defines a ``OpenWindowAction/callAsFunction(id:)`` method that Swift
    /// calls when you call the instance.
    ///
    /// For example, you can define a button that opens the specified note
    /// value in a new window.
    ///
    ///     @main
    ///     struct Notes: App {
    ///         var body: some Scene {
    ///             WindowGroup(for: Note.ID.self) { $noteID in
    ///                 // ...
    ///             }
    ///         }
    ///     }
    ///
    ///     struct NewNoteWindow: View {
    ///         var note: Note
    ///         @Environment(\.openWindow) private var openWindow
    ///
    ///         var body: some View {
    ///             Button("Open Note In New Window") {
    ///                 openWindow(value: note.id)
    ///             }
    ///         }
    ///     }
    ///
    public var openWindow: OpenWindowAction {
        OpenWindowAction()
    }
}
