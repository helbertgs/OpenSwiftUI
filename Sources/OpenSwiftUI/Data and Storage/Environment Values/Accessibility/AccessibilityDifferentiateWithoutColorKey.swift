import Swift

@frozen public struct AccessibilityDifferentiateWithoutColorKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the system preference for Differentiate without Color is enabled.
    /// If this is true, UI should not convey information using color alone and instead should use shapes or glyphs to convey information.
    ///
    /// The default value is `false`.
    public var accessibilityDifferentiateWithoutColor: Bool {
        get { self[AccessibilityDifferentiateWithoutColorKey.self] }
    }
}


