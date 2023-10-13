import Swift

@frozen public struct AccessibilityInvertColorsKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the system preference for Invert Colors is enabled.
    /// If this property’s value is true then the display will be inverted. 
    /// In these cases it may be needed for UI drawing to be adjusted to in order to display optimally when inverted.
    ///
    /// The default value is `false`.
    public var accessibilityInvertColors: Bool {
        get { self[AccessibilityInvertColorsKey.self] }
    }
}
