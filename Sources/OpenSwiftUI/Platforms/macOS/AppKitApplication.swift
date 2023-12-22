#if os(macOS) || canImport(AppKit)

import AppKit

@MainActor
class AppKitApplication {
    
    // MARK: - Property(ies).
    
    let appDelegate: AppDelegate = AppDelegate()
    
    // MARK: - Static Property(ies).
    
    static var app: (any App)!
    
    // MARK: - Static Property(ies).
    
    static let shared = AppKitApplication()

    // MARK: - Constructor(s).
    
    init() { }
    
    func run() {
        NSApplication.shared.delegate = self.appDelegate
        NSApplication.shared.run()
    }
}

#endif
