import Swift

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10, *)
public struct LegibilityWeightKey : EnvironmentKey {
    public static var defaultValue: LegibilityWeight {
        .regular
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10, *)
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
