#if os(Windows) && canImport(SwiftWin32)

import SwiftWin32

@MainActor
class WindowsKitApplication {
    
    // MARK: - Property(ies).
    
    let appDelegate: AppDelegate = AppDelegate()
    
    // MARK: - Static Property(ies).
    
    static let shared = WindowsKitApplication()

    // MARK: - Constructor(s).
    
    init() {
        SwiftWin32.ApplicationMain(
            CommandLine.argc,
            CommandLine.unsafeArgv,
            nil,
            String(describing: String(reflecting: OpenSwiftUI.WinApplicationDelegateAdapter.self)))
    }
}

#endif
