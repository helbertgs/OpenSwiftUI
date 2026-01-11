import Foundation
import Swift

public struct CalendarKey : EnvironmentKey {
    public static var defaultValue: Calendar {
        .current
    }
}

extension EnvironmentValues {
    /// The current calendar that views should use when handling dates.
    var calendar : Calendar {
        get { self[CalendarKey.self] }
        set { self[CalendarKey.self] = newValue }
    }
}
