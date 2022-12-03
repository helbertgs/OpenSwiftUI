#if os(iOS) && canImport(UIKit)

import Swift
import UIKit

class UIApplicationDelegateAdapter: NSObject, UIApplicationDelegate {

    // MARK: - Property(ies).

    var wrapper: UIApplicationDelegate?
    static var app: (any App)?

    // MARK: - Constructor(s).

    override init() {
        self.wrapper = nil
    }

    init(wrapper: UIApplicationDelegate? = nil) {
        self.wrapper = wrapper
    }

    // MARK: - UIApplicationDelegate Function(s).

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        return wrapper?.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: "Default Configuration", sessionRole: .windowApplication)
        config.delegateClass = OpenSwiftUI.UISceneAdapter.self
        config.storyboard = nil

        return config
    }
}

#endif
