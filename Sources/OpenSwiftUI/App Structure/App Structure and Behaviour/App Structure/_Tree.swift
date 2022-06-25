import Foundation

final class _Tree {

    var environmentValues = EnvironmentValues()
    var root: (any App)
    var scene: _SceneOutputs?

    static var shared = _Tree()

    init<T>(_ t: T.Type = EmptyApp.self) where T: App {
        self.environmentValues = EnvironmentValues()
        let app = T()
        self.root = app
        self.scene = T.Body._makeScene(scene: .init(app.body), inputs: .init())
    }

    struct EmptyApp: App {
        var body: some Scene {
            WindowGroup {

            }
        }
    }
}
