import Foundation

@frozen @MainActor @preconcurrency 
public struct AccessibilityOptionalRotorContent<Content>: AccessibilityRotorContent where Content : AccessibilityRotorContent {
  
    public let content: Content?
  
    @inlinable public init(_ content: Content?) {
        self.content = content
    }
  
    public var body: some AccessibilityRotorContent { 
        fatalError() 
    }
  
    nonisolated public static func _makeEntries(content: _GraphValue<AccessibilityOptionalRotorContent<Content>>, inputs: _AccessibilityRotorEntryInputs) -> _AccessibilityRotorEntryOutputs {
        .init()
    }

    nonisolated public static func _entryCount(inputs: _AccessibilityRotorEntryInputs) -> Int? {
        0
    }
}