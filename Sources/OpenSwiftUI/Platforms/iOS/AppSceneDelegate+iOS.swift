#if canImport(UIKit) || os(iOS)
import UIKit

class AppSceneDelegate: UIResponder, UISceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        delegate.graph.makeRootScene.context()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        delegate.graph._rootScenePhase = .inactive
    }

    
    func sceneDidBecomeActive(_ scene: UIScene) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        delegate.graph._rootScenePhase = .active
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        delegate.graph._rootScenePhase = .background
    }
}

#endif
