import Foundation
import Swift

public struct TimeZoneKey : EnvironmentKey {
    public static var defaultValue: TimeZone {
        .current
    }
}

extension EnvironmentValues {
    /// The current time zone that views should use when handling dates.
    var timeZone: TimeZone {
        get { self[TimeZoneKey.self] }
        set { self[TimeZoneKey.self] = newValue }
    }
}
