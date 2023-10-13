import Swift

@frozen public struct AccessibilityReduceMotionKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the setting for playing animations in an animated image is on. When this value is false, any presented image that contains animation should not play automatically.
    /// The default value is `false`.
    public var accessibilityReduceMotion: Bool {
        get { self[AccessibilityReduceMotionKey.self] }
    }
}
