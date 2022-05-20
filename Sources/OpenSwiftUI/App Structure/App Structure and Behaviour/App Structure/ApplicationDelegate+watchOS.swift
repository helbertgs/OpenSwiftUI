#if os(watchOS) && canImport(WatchKit)
import WatchKit

extension ApplicationDelegate : WKExtensionDelegate { }
#endif
