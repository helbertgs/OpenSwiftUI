#if os(Windows) && canImport(SwiftWin32)
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    // MARK: - Property(ies).
    
    let graph = AppGraph()
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print(#function)
        window = .init(
            contentRect: .init(x: 0, y: 0, width: 480, height: 270),
            styleMask: [ .miniaturizable, .closable, .resizable, .titled ],
            backing: .buffered,
            defer: false)

        window.center()
        window.title = "Window Application"
        window.makeKeyAndOrderFront(nil)
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        true
    }
}

#endif
