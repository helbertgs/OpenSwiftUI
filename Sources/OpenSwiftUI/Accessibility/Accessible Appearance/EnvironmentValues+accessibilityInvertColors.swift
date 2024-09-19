import Foundation

struct AccessibilityInvertColorsKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the system preference for Invert Colors is enabled.
    /// If this property’s value is true then the display will be inverted. 
    /// In these cases it may be needed for UI drawing to be adjusted to in order to display optimally when inverted.
    var accessibilityInvertColors : Bool {
        get { self[AccessibilityInvertColorsKey.self] }
        set { self[AccessibilityInvertColorsKey.self] = newValue }
    }
}