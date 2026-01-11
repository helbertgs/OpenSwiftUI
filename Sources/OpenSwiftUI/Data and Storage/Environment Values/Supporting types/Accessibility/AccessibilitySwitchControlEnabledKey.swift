import Swift

@frozen public struct AccessibilitySwitchControlEnabledKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether the Switch Control motor accessibility feature is in use.
    /// The state changes as the user turns on or off the Switch Control feature.
    /// 
    /// The default value is `false`.
    public var accessibilitySwitchControlEnabled: Bool {
        get { self[AccessibilitySwitchControlEnabledKey.self] }
    }
}