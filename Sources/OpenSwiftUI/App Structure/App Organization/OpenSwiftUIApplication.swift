import AppKit


@MainActor
class OpenSwiftUIApplication {

    private var app: (any App)?

    static let shared = OpenSwiftUIApplication()

    func run<T>(_ app: T) where T: App {
        self.app = app

        let scene = T.Body._makeScene(scene: .init(app.body), inputs: .init())
        // dump(scene)

        guard let rootView = scene.content?.view else {
            return
        }

        let window = NSWindow(contentViewController: NSHostingController(rootView: AnyView(rootView)))
        window.makeKeyAndOrderFront(nil)

        NSApplication.shared.run()
    }
}
