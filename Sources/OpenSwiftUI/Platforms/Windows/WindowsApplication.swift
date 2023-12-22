#if os(Windows) && canImport(SwiftWin32)

import WinSDK

class WindowsKitApplication {
    
    // MARK: - Property(ies).
    
    let appDelegate: AppDelegate
    
    // MARK: - Static Property(ies).
    
    static let shared = AppKitApplication()

    // MARK: - Constructor(s).
    
    init(appDelegate: AppDelegate = AppDelegate()) {
        self.appDelegate = appDelegate
        
        SwiftWin32.ApplicationMain(
            CommandLine.argc,
            CommandLine.unsafeArgv,
            nil,
            String(describing: String(reflecting: OpenSwiftUI.WinApplicationDelegateAdapter.self)))
    }
}

#endif
