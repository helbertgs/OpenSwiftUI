import Foundation
import Swift

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10, *)
public struct CalendarKey : EnvironmentKey {
    public static var defaultValue: Calendar {
        .current
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10, *)
extension EnvironmentValues {
    /// The current calendar that views should use when handling dates.
    var calendar : Calendar {
        get { self[CalendarKey.self] }
        set { self[CalendarKey.self] = newValue }
    }
}
