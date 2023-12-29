#if os(Windows) && canImport(SwiftWin32)

import SwiftWin32

extension WindowGroup {
   public static func _makeScene(scene: _GraphValue<WindowGroup<Content>>, inputs: _SceneInputs) -> _SceneOutputs {

    var rootViewController = SwiftWin32.ViewController()
    rootViewController.title = scene.value.title

    let env: EnvironmentValues = inputs.environmentValues
    let window = SwiftWin32.Window(windowScene: env.windowScene)
    window.makeKeyAndVisible()
    window.rootViewController = rootViewController

    var outputs = _SceneOutputs()
    outputs.window = window

    return outputs
    }
}

#endif
