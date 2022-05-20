import Foundation
import Swift

class ApplicationDelegate : NSObject {

}


#if os(iOS) && canImport(UIKit)
import UIKit

extension ApplicationDelegate : UIApplicationDelegate { }
#endif

#if os(macOS) && canImport(AppKit)
import AppKit

extension ApplicationDelegate : NSApplicationDelegate { }
#endif

#if os(watchOS) && canImport(WatchKit)
import WatchKit

extension ApplicationDelegate : WKExtensionDelegate { }
#endif
