import Foundation

class AccessibilityAdjustableAction : AnyAccessibilityAction {
    var continuous: Bool?

    init(continuous: Bool?) {
        self.continuous = continuous
    }
}