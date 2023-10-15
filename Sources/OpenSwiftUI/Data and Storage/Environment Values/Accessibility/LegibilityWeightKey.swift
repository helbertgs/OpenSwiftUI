import Swift

public struct LegibilityWeightKey : EnvironmentKey {
    public static var defaultValue: LegibilityWeight {
        .regular
    }
}

extension EnvironmentValues {
    /// The font weight to apply to text.
    ///
    /// This value reflects the value of the Bold Text display setting found in
    /// the Accessibility settings.
    public var legibilityWeight: LegibilityWeight? {
        get { self[LegibilityWeightKey.self] }
        set { self[LegibilityWeightKey.self] = newValue ?? LegibilityWeightKey.defaultValue }
    }
}
