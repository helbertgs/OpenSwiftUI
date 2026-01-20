import OpenSwiftUI

@main
struct MyApp : App {
    var body: some Scene {
        Window("OpenSwiftUI", id: "open-swiftui") {
            EmptyView()
        }
        .defaultSize(.init(width: 400, height: 300))
        .windowStyle(.hiddenTitleBar)
    }
}
