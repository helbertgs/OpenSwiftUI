import Foundation
import Swift

public struct LocaleKey : EnvironmentKey {
    public static var defaultValue: Locale {
        .current
    }
}

extension EnvironmentValues {
    /// The current locale that views should use.
    var locale: Locale {
        get { self[LocaleKey.self] }
        set { self[LocaleKey.self] = newValue }
    }
}
