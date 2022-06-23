import Foundation

final class _Tree {

    var environmentValues = EnvironmentValues()
    var root: _SceneOutputs? {
        willSet {
            dump(newValue)
        }
    }

    static var shared = _Tree()

    init(environmentValues: EnvironmentValues = EnvironmentValues(), root: _SceneOutputs? = nil) {
        self.environmentValues = environmentValues
        self.root = root

        print(root)
    }
}
