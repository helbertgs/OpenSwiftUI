#if os(iOS) && canImport(UIKit)

import Swift
import UIKit

class UIApplicationAdapter: NSObject, UIApplicationDelegate {

    // MARK: - Property(ies).

    var wrapper: UIApplicationDelegate?

    // MARK: - Singleton.

    static let shared = UIApplicationAdapter()

    // MARK: - Constructor(s).

    override init() {
        self.wrapper = nil
    }

    init(wrapper: UIApplicationDelegate? = nil) {
        self.wrapper = wrapper
    }

    // MARK: - UIApplicationDelegate Function(s).

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        wrapper?.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        if connectingSceneSession.role == UISceneSession.Role.windowApplication {
            let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
            config.delegateClass = UISceneAdapter.self
            config.storyboard = nil

            return wrapper?.application?(application, configurationForConnecting: connectingSceneSession, options: options) ?? config
        }

        fatalError("Unhandled scene role \(connectingSceneSession.role)")
    }
}

#endif
