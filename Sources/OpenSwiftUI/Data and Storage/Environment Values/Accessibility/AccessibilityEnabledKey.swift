import Swift

@frozen public struct AccessibilityEnabledKey : EnvironmentKey {
    public static var defaultValue: Bool {
        true
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether the user has enabled an assistive technology.
    ///
    /// The default value is `true`.
    public var accessibilityEnabled: Bool {
        get { self[AccessibilityEnabledKey.self] }
        set { self[AccessibilityEnabledKey.self] = newValue }
    }
}
