import AppKit
import OpenSwiftUI

class MyAppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow?
}

@main
struct MyApp : App {

    @NSApplicationDelegateAdaptor private var delegate: MyAppDelegate

    var body: some Scene {
        WindowGroup("Sample") {
            EmptyView()
        }
    }
}
