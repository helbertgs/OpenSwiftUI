#if canImport(UIKit)

import Swift
import UIKit

class _Application: UIApplication {
    override var delegate: UIApplicationDelegate? {
        get { UIApplicationAdapter.shared }
        set { let _ = newValue }
    }
}

#endif
