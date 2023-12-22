#if canImport(AppKit) || os(macOS)

import AppKit
import CoreGraphics

extension WindowGroup {
    public static func _makeScene(scene: _GraphValue<WindowGroup<Content>>, inputs: _SceneInputs) -> _SceneOutputs {
        let origin: UnitPoint = inputs.origin
        let size: Size =  inputs.size
        
        let window = NSWindow(
            contentRect: .init(x: CGFloat(origin.x), y: CGFloat(origin.y), width: CGFloat(size.width), height: CGFloat(size.height)),
            styleMask: [ /*.miniaturizable, .closable, .resizable,*/ .titled ],
            backing: .buffered,
            defer: false)

        let viewController = NSHostingController(rootView: scene.value.content)
        let view = NSHostingView(rootView: scene.value.content)
        view.layer?.backgroundColor = .white
        viewController.view = view
        window.contentViewController = viewController
        
        var outputs = _SceneOutputs()
        outputs.window = window
        
        window.center()
        window.title = scene.value.title
        window.makeKeyAndOrderFront(nil)

        return outputs
    }
}

#endif
