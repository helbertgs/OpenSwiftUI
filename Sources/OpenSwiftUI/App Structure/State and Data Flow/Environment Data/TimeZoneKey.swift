import Foundation
import Swift

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 1, *)
public struct TimeZoneKey : EnvironmentKey {
    public static var defaultValue: TimeZone {
        .current
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 1, *)
extension EnvironmentValues {
    /// The current time zone that views should use when handling dates.
    var timeZone: TimeZone {
        get { self[TimeZoneKey.self] }
        set { self[TimeZoneKey.self] = newValue }
    }
}
