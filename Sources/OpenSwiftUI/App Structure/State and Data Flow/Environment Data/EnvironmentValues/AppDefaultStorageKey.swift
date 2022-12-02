import Foundation
import Swift

struct DefaultAppStorageKey : EnvironmentKey {
    static var defaultValue: UserDefaults {
        .standard
    }
}

extension EnvironmentValues {
    /// The current calendar that views should use when handling dates.
    var defaultAppStorage : UserDefaults {
        get { self[DefaultAppStorageKey.self] }
        set { self[DefaultAppStorageKey.self] = newValue }
    }
}
