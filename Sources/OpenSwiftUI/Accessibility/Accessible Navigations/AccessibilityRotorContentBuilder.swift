import Foundation

/// Result builder you use to generate rotor entry content.
@MainActor @resultBuilder public struct AccessibilityRotorContentBuilder {
    
    public static func buildExpression<Content>(_ content: Content) -> Content where Content: AccessibilityRotorContent {
       content
    }
    
    public static func buildBlock<Content>(_ content: Content) -> some AccessibilityRotorContent where Content: AccessibilityRotorContent {
        content
    }
  
    public static func buildIf<Content>(_ content: Content?) -> some AccessibilityRotorContent where Content: AccessibilityRotorContent {
        AccessibilityOptionalRotorContent(content)
    }
}