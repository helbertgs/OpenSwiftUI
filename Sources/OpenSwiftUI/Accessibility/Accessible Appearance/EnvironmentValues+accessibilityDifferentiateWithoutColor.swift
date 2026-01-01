import Foundation

struct AccessibilityDifferentiateWithoutColorKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the system preference for Differentiate without Color is enabled.
    /// If this is true, UI should not convey information using color alone and instead should use shapes or glyphs to convey information.
    var accessibilityDifferentiateWithoutColor : Bool {
        get { self[AccessibilityDifferentiateWithoutColorKey.self] }
        set { self[AccessibilityDifferentiateWithoutColorKey.self] = newValue }
    }
}