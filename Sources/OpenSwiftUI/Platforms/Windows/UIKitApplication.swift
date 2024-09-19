// #if os(iOS) || canImport(UIKit)

// import UIKit

// class UIKitApplication {
    
//     // MARK: - Property(ies).
    
//     var appDelegate: AppDelegate!
    
//     // MARK: - Static Property(ies).
    
//     static let shared = UIKitApplication()

//     // MARK: - Constructor(s).
    
//     init(appDelegate: AppDelegate = AppDelegate()) {
//         self.appDelegate = appDelegate
        
//         UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(OpenSwiftUI.AppDelegate.self))
//         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//             return
//         }
        
//         self.appDelegate = appDelegate
//     }
// }

// #endif
