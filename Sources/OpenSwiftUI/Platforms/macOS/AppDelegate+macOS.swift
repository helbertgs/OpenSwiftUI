#if os(macOS) || canImport(AppKit)
import AppKit

@MainActor
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // MARK: - Property(ies).
    
    let graph = AppGraph()
    
    // MARK: - Function(s).
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        graph.makeRootScene.context()
    }
}

#endif
