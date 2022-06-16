import Swift

@frozen public struct EnabledKey : EnvironmentKey {
    public static var defaultValue: Bool {
        true
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether the view associated with this
    /// environment allows user interaction.
    ///
    /// The default value is `true`.
    public var isEnabled: Bool {
        get { self[EnabledKey.self] }
        set { self[EnabledKey.self] = newValue }
    }
}
