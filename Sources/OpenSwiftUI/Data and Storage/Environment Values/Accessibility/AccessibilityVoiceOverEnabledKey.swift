import Swift

@frozen public struct AccessibilityVoiceOverEnabledKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether the VoiceOver screen reader is in use.
    /// The state changes as the user turns on or off the VoiceOver screen reader.
    /// 
    /// The default value is `false`.
    public var accessibilityVoiceOverEnabled: Bool {
        get { self[AccessibilityVoiceOverEnabledKey.self] }
    }
}