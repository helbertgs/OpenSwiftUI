import Foundation

public struct AccessibilityAttachment {
    var properties: AccessibilityProperties
    var platformElement: (any PlatformAccessibilityElementProtocol)?

    init(properties: AccessibilityProperties, platformElement: (any PlatformAccessibilityElementProtocol)?) {
        self.properties = properties
        self.platformElement = platformElement
    }
}