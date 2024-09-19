import Foundation

struct AccessibilityReduceTransparencyKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the system preference for Reduce Transparency is enabled.
    /// If this property’s value is true, UI (mainly window) backgrounds should not be semi-transparent; they should be opaque.
    var accessibilityReduceTransparency : Bool {
        get { self[AccessibilityReduceTransparencyKey.self] }
        set { self[AccessibilityReduceTransparencyKey.self] = newValue }
    }
}