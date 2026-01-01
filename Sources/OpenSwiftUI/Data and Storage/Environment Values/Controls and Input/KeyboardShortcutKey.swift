import Swift

public struct KeyboardShortcutKey : EnvironmentKey {
    public static var defaultValue: KeyboardShortcut? {
        nil
    }
}

extension EnvironmentValues {

    /// The keyboard shortcut that buttons in this environment will be triggered
    /// with.
    ///
    /// This is particularly useful in button styles when a button's appearance
    /// depends on the shortcut associated with it. On macOS, for example, when
    /// a button is bound to the Return key, it is typically drawn with a
    /// special emphasis. This happens automatically when using the built-in
    /// button styles, and can be implemented manually in custom styles using
    /// this environment key:
    ///
    ///     private struct MyButtonStyle: ButtonStyle {
    ///         @Environment(\.keyboardShortcut)
    ///         private var shortcut: KeyboardShortcut?
    ///
    ///         func makeBody(configuration: Configuration) -> some View {
    ///             let labelFont = Font.body
    ///                 .weight(shortcut == .defaultAction ? .bold : .regular)
    ///             configuration.label
    ///                 .font(labelFont)
    ///         }
    ///     }
    ///
    /// If no keyboard shortcut has been applied to the view or its ancestor,
    /// then the environment value will be `nil`.
    public var keyboardShortcut: KeyboardShortcut? {
        get { self[KeyboardShortcutKey.self] }
        set { self[KeyboardShortcutKey.self] = newValue }
    }
}
