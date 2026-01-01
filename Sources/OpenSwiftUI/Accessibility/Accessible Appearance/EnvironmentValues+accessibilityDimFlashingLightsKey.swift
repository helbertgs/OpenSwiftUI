import Swift

struct AccessibilityDimFlashingLightsKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether the user has enabled an assistive technology.
    ///
    /// The default value is `false`.
    public var AccessibilityDimFlashingLightsKey: Bool {
        get { self[AccessibilityEnabledKey.self] }
        set { self[AccessibilityEnabledKey.self] = newValue }
    }
}
