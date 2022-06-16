import Foundation
import Swift

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 1, *)
struct DefaultAppStorageKey : EnvironmentKey {
    static var defaultValue: UserDefaults {
        .standard
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 1, *)
extension EnvironmentValues {
    /// The current calendar that views should use when handling dates.
    var defaultAppStorage : UserDefaults {
        get { self[DefaultAppStorageKey.self] }
        set { self[DefaultAppStorageKey.self] = newValue }
    }
}
