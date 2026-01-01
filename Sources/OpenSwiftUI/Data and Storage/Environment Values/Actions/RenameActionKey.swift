import Swift

@frozen public struct RenameActionKey : EnvironmentKey {
    public static var defaultValue: RenameAction? { nil }
}

extension EnvironmentValues {
    /// An action that activates the standard rename interaction.
    ///
    /// Use the ``View/renameAction(_:)-6lghl`` modifier to configure the rename
    /// action in the environment.
    public var rename: RenameAction? {
        get { self[RenameActionKey.self] }
        set { self[RenameActionKey.self] = newValue }
    }
}