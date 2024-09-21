import Foundation

class AccessibilityActionStorage<Value> : AnyAccessibilityAction {
    var action: Value
    var category: AccessibilityActionCategory?
    var label: Text?
    var image: Image?
    var handler: Any?
    var seed: Int

    init(action: Value, category: AccessibilityActionCategory?, label: Text?, image: Image?, handler: Any?, seed: Int) {
        self.action = action
        self.category = category
        self.label = label
        self.image = image
        self.handler = handler
        self.seed = seed
    }
}