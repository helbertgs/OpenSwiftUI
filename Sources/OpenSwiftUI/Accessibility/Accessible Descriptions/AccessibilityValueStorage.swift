import Foundation

struct AccessibilityValueStorage {
    let value: AnyAccessibilityValue?
    let description: Array<Text>

    init(value: AnyAccessibilityValue?, description: Array<Text>) {
        self.value = value
        self.description = description
    }
}