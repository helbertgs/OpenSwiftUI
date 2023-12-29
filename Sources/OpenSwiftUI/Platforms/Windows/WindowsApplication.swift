#if os(Windows) && canImport(SwiftWin32)

import SwiftWin32

@MainActor
class WindowsApplication {
    
    // MARK: - Property(ies).
    
    let appDelegate: AppDelegate = AppDelegate()

    // MARK: - Static Property(ies).
    
    static var app: (any App)!
    
    // MARK: - Static Property(ies).
    
    static let shared = WindowsApplication()

    // MARK: - Constructor(s).
    
    init() {
       
    }

    // MARK: - Function(s).

    func run() {
         SwiftWin32.ApplicationMain(
            CommandLine.argc,
            CommandLine.unsafeArgv,
            nil,
            String(describing: String(reflecting: OpenSwiftUI.AppDelegate.self)))
    }
}

#endif
