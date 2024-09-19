import Foundation

struct AccessibilityAssistiveAccessEnabledKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// A Boolean value that indicates whether Assistive Access is in use.
    var accessibilityAssistiveAccessEnabled : Bool {
        get { self[AccessibilityAssistiveAccessEnabledKey.self] }
        set { self[AccessibilityAssistiveAccessEnabledKey.self] = newValue }
    }
}