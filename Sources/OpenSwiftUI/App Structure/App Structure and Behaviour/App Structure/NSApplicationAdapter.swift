#if os(macOS) && canImport(AppKit)

import AppKit
import Swift

class NSApplicationAdapter: NSObject, NSApplicationDelegate {

    // MARK: - Property(ies).

    var wrapper: NSApplicationDelegate?

    // MARK: - Singleton.

    static let shared = NSApplicationAdapter()

    // MARK: - Constructor(s).

    init(wrapper: NSApplicationDelegate? = nil) {
        self.wrapper = wrapper
    }
}

#endif
