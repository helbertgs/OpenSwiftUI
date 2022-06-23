#if canImport(UIKit)

import Swift
import UIKit

class _Application: UIApplication {
    var environmentValues = EnvironmentValues()
    var root: _SceneOutputs?
}

#endif
