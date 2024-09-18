import Swift

extension Scene {

    /// Defines a keyboard shortcut for opening new scene windows.
    ///
    /// A scene's keyboard shortcut is bound to the command it adds for creating
    /// new windows (in the case of `WindowGroup` and `DocumentGroup`) or
    /// bringing a singleton window forward (in the case of `Window` and, on
    /// macOS, `Settings`). Pressing the keyboard shortcut is equivalent to
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
        modifier(_PreferenceTransformModifier(key: KeyboardShortcut(key, modifiers: modifiers, localization: localization)))
    }

    /// Defines a keyboard shortcut for opening new scene windows.
    ///
    /// A scene's keyboard shortcut is bound to the command it adds for creating
    /// new windows (in the case of `WindowGroup` and `DocumentGroup`) or
    /// bringing a singleton window forward (in the case of `Window` and, on
    /// macOS, `Settings`). Pressing the keyboard shortcut is equivalent to
    /// selecting the menu command.
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
    /// associated with a keyboard shortcut, even if SwiftUI normally assigns
    /// one automatically.
    ///
    /// - Parameters:
    ///   - shortcut: The keyboard shortcut for presenting the scene, or `nil`.
    /// - Returns: A scene that can be presented with a keyboard shortcut.
    public func keyboardShortcut(_ shortcut: KeyboardShortcut?) -> some Scene {
        modifier(_PreferenceTransformModifier(key: shortcut))
    }
}
