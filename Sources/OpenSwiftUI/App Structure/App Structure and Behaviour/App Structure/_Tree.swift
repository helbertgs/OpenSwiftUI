import Foundation

final class _Tree {

    var environmentValues = EnvironmentValues()
    var root: (any App)? {
        didSet {
            if let value = oldValue {
               scene = run(value.body)
            }
        }
    }

    var scene: _SceneOutputs? {
        didSet {
            dump(oldValue)
        }
    }

    static var shared = _Tree()

    init(environmentValues: EnvironmentValues = EnvironmentValues(), root: (any App)? = nil) {
        self.environmentValues = environmentValues
        self.root = root
    }

    func run<T>(_ scene: T) -> _SceneOutputs where T : Scene {
        T._makeScene(scene: .init(scene), inputs: .init())
    }
}
