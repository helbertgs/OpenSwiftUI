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
            VStack {
                EmptyView()

                EmptyView()
                    .onAppear {
                        print("Hello, World")
                    }
            }
        }
        .defaultAppStorage(UserDefaults.standard)
        .defaultSize(.init(width: 800, height: 600))
    }
}
