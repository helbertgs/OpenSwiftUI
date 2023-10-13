import Swift

@frozen public struct AccessibilityDimFlashingLightsKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether the user has enabled an assistive technology.
    ///
    /// The default value is `false`.
    public var AccessibilityDimFlashingLightsKey: Bool {
        get { self[AccessibilityEnabledKey.self] }
    }
}
