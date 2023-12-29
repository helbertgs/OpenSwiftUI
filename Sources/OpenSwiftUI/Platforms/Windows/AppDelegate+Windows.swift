#if os(Windows) && canImport(SwiftWin32)
import SwiftWin32

@MainActor
class AppDelegate : ApplicationDelegate {
    
    // MARK: - Property(ies).
    
    let graph = AppGraph()

    // MARK: - Constructor(s).

    required init() { }

    // MARK: - Function(s).

    func application(_ application: SwiftWin32.Application, 
                     didFinishLaunchingWithOptions options: [SwiftWin32.Application.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ application: SwiftWin32.Application, 
                    configurationForConnecting connectingSceneSession: SwiftWin32.SceneSession, 
                    options: SwiftWin32.Scene.ConnectionOptions) -> SwiftWin32.SceneConfiguration {
        let configuration = SwiftWin32.SceneConfiguration(name: "Configuration", sessionRole: connectingSceneSession.role)
        configuration.delegateClass = OpenSwiftUI.AppSceneDelegate.self

        return configuration
    }
}

#endif
