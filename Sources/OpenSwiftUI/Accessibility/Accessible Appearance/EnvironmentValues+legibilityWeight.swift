import Foundation

struct LegibilityWeightKey : EnvironmentKey {
    static var defaultValue: LegibilityWeight? {
        nil
    }
}

extension EnvironmentValues {
    /// The font weight to apply to text.
    /// This value reflects the value of the Bold Text display setting found in the Accessibility settings.
    var legibilityWeight : LegibilityWeight? {
        get { self[LegibilityWeightKey.self] }
        set { self[LegibilityWeightKey.self] = newValue }
    }
}