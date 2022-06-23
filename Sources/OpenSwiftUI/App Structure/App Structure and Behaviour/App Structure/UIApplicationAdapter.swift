#if os(iOS) && canImport(UIKit)

import Swift
import UIKit

class UIApplicationAdapter: NSObject, UIApplicationDelegate {

    // MARK: - Property(ies).

    var wrapper: UIApplicationDelegate?
    var environmentValues = EnvironmentValues()
    var root: _SceneOutputs?

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
        print(#function)
        return wrapper?.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UIApplicationAdapter.shared.root?.config ?? .init(name: nil, sessionRole: .windowApplication)
    }
}

#endif
