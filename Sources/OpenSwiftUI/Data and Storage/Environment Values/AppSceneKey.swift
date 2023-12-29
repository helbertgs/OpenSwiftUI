#if os(Windows) && canImport(SwiftWin32)
import Foundation
import Swift
import SwiftWin32

struct AppSceneKey : EnvironmentKey {
    static var defaultValue: SwiftWin32.WindowScene {
        fatalError()
    }
}

extension EnvironmentValues {
    /// The current calendar that views should use when handling dates.
    var windowScene : SwiftWin32.WindowScene {
        get { self[AppSceneKey.self] }
        set { self[AppSceneKey.self] = newValue }
    }
}

#endif