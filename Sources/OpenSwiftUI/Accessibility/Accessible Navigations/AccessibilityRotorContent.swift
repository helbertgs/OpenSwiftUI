import Foundation

@MainActor @preconcurrency
public protocol AccessibilityRotorContent {
    
    // MARK: - Supporting types
    
    /// The type for the internal content of this AccessibilityRotorContent.
    associatedtype Body : AccessibilityRotorContent
    
    /// The internal content of this AccessibilityRotorContent.
    @AccessibilityRotorContentBuilder var body: Self.Body { get }

    nonisolated static func _makeEntries(content: _GraphValue<Self>, inputs: _AccessibilityRotorEntryInputs) -> _AccessibilityRotorEntryOutputs
    nonisolated static func _entryCount(inputs: _AccessibilityRotorEntryInputs) -> Int?
}

extension Never: AccessibilityRotorContent {
    nonisolated public static func _makeEntries(content: _GraphValue<Never>, inputs: _AccessibilityRotorEntryInputs) -> _AccessibilityRotorEntryOutputs {
        fatalError()
    }

    nonisolated public static func _entryCount(inputs: _AccessibilityRotorEntryInputs) -> Int? {
        fatalError()
    }
}