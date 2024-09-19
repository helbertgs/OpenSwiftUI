import Swift

struct AccessibilityPlayAnimatedImagesKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the setting for playing animations in an animated image is on. When this value is false, any presented image that contains animation should not play automatically.
    /// The default value is `false`.
    public var accessibilityPlayAnimatedImages: Bool {
        get { self[AccessibilityPlayAnimatedImagesKey.self] }
        set { self[AccessibilityPlayAnimatedImagesKey.self] = newValue }
    }
}