#if os(Windows) && canImport(SwiftWin32)
import SwiftWin32

@MainActor
class AppSceneDelegate : SwiftWin32.SceneDelegate {

    // MARK: - Constructor(s).

    required init() { }
    
    // MARK: - Function(s).

    func scene(_ scene: SwiftWin32.Scene, willConnectTo session: SwiftWin32.SceneSession, options: SwiftWin32.Scene.ConnectionOptions) {
        guard let windowScene = scene as? SwiftWin32.WindowScene,
              let appDelegate = SwiftWin32.Application.shared.delegate as? OpenSwiftUI.AppDelegate
        else { return }
        appDelegate.graph._environmentValues.windowScene = windowScene
        appDelegate.graph.makeRootScene.context()
    }
}

#endif
