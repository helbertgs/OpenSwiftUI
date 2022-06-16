import Swift

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 1, *)
@frozen public struct EnabledKey : EnvironmentKey {
    public static var defaultValue: Bool {
        true
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 1, *)
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
