import AppKit

@MainActor
class OpenSwiftUIApplication {

    private var app: (any App)?

    static let shared = OpenSwiftUIApplication()

    func run<T>(_ app: T) where T: App {
        self.app = app

        let window = NSWindow(contentViewController: NSHostingController(rootView: EmptyView()))
        window.makeKeyAndOrderFront(nil)

        NSApplication.shared.run()
    }
}