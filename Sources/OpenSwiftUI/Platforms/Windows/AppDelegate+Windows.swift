#if os(Windows) && canImport(SwiftWin32)
import SwiftWin32

@MainActor
class AppDelegate {
    
    // MARK: - Property(ies).
    
    let graph = AppGraph()

    // MARK: - Constructor(s).

    init() {
        
    }
}

#endif
