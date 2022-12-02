#if os(iOS) && canImport(UIKit)

import Swift
import UIKit

class UIApplicationDelegateAdapter: NSObject, UIApplicationDelegate {

    // MARK: - Property(ies).

    var wrapper: UIApplicationDelegate?
    var environmentValues = EnvironmentValues()
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
        var inputs = _SceneInputs()
        inputs.application = application
        inputs.connectingSceneSession = connectingSceneSession
        inputs.options = options

        guard let app = UIApplicationDelegateAdapter.app else { return .init() }
        let outputs = transform(app, inputs: inputs)
        return outputs.sceneConfiguration
    }

    func transform<T>(_ anyScene: T, inputs: _SceneInputs) -> _SceneOutputs where T : App {
        T.Body._makeScene(scene: _GraphValue(anyScene.body), inputs: inputs)
    }
}

#endif
