import Foundation
import Swift

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10, *)
public struct LocaleKey : EnvironmentKey {
    public static var defaultValue: Locale {
        .current
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10, *)
extension EnvironmentValues {
    /// The current locale that views should use.
    var locale: Locale {
        get { self[LocaleKey.self] }
        set { self[LocaleKey.self] = newValue }
    }
}
