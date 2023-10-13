import Swift

@frozen public struct AccessibilityReduceTransparencyKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the system preference for Reduce Transparency is enabled.
    /// If this property’s value is true, UI (mainly window) backgrounds should not be semi-transparent; they should be opaque.
    /// 
    /// The default value is `false`.
    public var accessibilityReduceTransparency: Bool {
        get { self[AccessibilityReduceTransparencyKey.self] }
    }
}