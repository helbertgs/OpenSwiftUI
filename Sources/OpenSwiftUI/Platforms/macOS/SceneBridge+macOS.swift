#if canImport(AppKit) || os(macOS)
import AppKit

class SceneBridge {
    
    // MARK: - Property(ies).
    
    let rootViewController: NSHostingController<any View>
    
    // MARK: - Constructor(s).
    
    init(rootViewController: NSHostingController<any View>) {
        self.rootViewController = rootViewController
    }
}

#endif
