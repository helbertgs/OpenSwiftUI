import Foundation

struct AccessibilityLabelStorage {
    var texts: Text
    var placement: Placement

    init(texts: Text, placement: Placement) {
        self.texts = texts
        self.placement = placement
    }
}

extension AccessibilityLabelStorage {
    enum Placement {
        case assign
    }
}