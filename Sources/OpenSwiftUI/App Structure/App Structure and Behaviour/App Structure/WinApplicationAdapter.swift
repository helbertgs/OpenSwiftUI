#if os(Windows) && canImport(SwiftWin32)

import Foundation
import Swift
import SwiftWin32

class WinApplicationDelegateAdapter: SwiftWin32.ApplicationDelegate {

    // MARK: - Property(ies).

    var wrapper: SwiftWin32.ApplicationDelegate?
    static var app: (any OpenSwiftUI.App)?

    // MARK: - Constructor(s).

    required init() {
        self.wrapper = nil
    }

    init(wrapper: SwiftWin32.ApplicationDelegate? = nil) {
        self.wrapper = wrapper
    }

    // MARK: - UIApplicationDelegate Function(s).

    func application(_ application: SwiftWin32.Application, didFinishLaunchingWithOptions launchOptions: [SwiftWin32.Application.LaunchOptionsKey: Any]? = nil) -> Bool {
        return wrapper?.application(application, didFinishLaunchingWithOptions: launchOptions) ?? true
    }

    func application(_ application: SwiftWin32.Application, configurationForConnecting connectingSceneSession: SwiftWin32.SceneSession, options: SwiftWin32.Scene.ConnectionOptions) -> SwiftWin32.SceneConfiguration {
        let config = SwiftWin32.SceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        config.delegateClass = OpenSwiftUI.WinSceneAdapter.self

        return config
    }
}

#endif
