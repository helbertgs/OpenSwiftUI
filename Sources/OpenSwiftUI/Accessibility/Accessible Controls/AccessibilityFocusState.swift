import Foundation

/// A property wrapper type that can read and write a value that OpenSwiftUI updates as the focus of any active accessibility technology, such as VoiceOver, changes.
@frozen public struct AccessibilityFocusState<Value> where Value : Hashable {

    private var value: Value

    // MARK: - Creating a focus state

    /// Creates a new accessibility focus state for a Boolean value.
    public init(value: Value) {
        self.value = value
    }
}
