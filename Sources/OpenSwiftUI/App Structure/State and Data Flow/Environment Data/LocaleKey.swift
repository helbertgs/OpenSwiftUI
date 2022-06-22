import Foundation
import Swift

public struct LocaleKey : EnvironmentKey {
    public static var defaultValue: Locale {
        .current
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func _valuesEqual(_ lhs: Locale, _ rhs: Locale) -> Bool {
        lhs == rhs
    }
}

extension EnvironmentValues {
    /// The current locale that views should use.
    var locale: Locale {
        get { self[LocaleKey.self] }
        set { self[LocaleKey.self] = newValue }
    }
}
