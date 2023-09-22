#if os(Windows) && canImport(SwiftWin32)

import Foundation
import Swift
import SwiftWin32

class WinSceneAdapter: SwiftWin32.SceneDelegate {

    // MARK: - Property(ies).

    var window: SwiftWin32.Window?

    // MARK: - Constructor(s).

    required init() { }

    // MARK: - Function(s).

    func scene(_ scene: SwiftWin32.Scene, willConnectTo session: SwiftWin32.SceneSession, options connectionOptions: SwiftWin32.Scene.ConnectionOptions) {
        if let windowScene = scene as? SwiftWin32.WindowScene {
            let size = SwiftWin32.Size(width: 800, height: 600)
            windowScene.sizeRestrictions?.minimumSize = size
            windowScene.sizeRestrictions?.maximumSize = size

            self.window = Window(windowScene: windowScene)
            self.window?.rootViewController = ViewController()
            self.window?.makeKeyAndVisible()
        }
    }
}

#endif
