#if os(iOS) && canImport(UIKit)
import UIKit

class AppDelegate : NSObject, UIApplicationDelegate {
    
    // MARK: - Property(ies).
    
    var graph = AppGraph()
    
    // MARK: - Constructor(s).
    
    override init() {
        super.init()
        
    }
    
    // MARK: - Function(s).
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}

#endif
