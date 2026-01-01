import Foundation

public protocol AccessibilityQuickActionStyle {
    
    // MARK: - Getting built-in menu styles
    /// A presentation style that animates an outline around the view when the accessibility quick action is active.
    static var outline: AccessibilityQuickActionOutlineStyle { get }

    /// A presentation style that displays a prompt to the user when the accessibility quick action is active.
    static var prompt: AccessibilityQuickActionPromptStyle { get }
}

extension AccessibilityQuickActionStyle {
    public static var outline: AccessibilityQuickActionOutlineStyle {
        .init()
    }
}

extension AccessibilityQuickActionStyle {
    public static var prompt: AccessibilityQuickActionPromptStyle {
        .init()
    }
}