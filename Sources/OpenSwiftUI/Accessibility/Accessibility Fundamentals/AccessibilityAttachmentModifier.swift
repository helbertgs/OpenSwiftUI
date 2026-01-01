import Foundation

/// A view modifier that adds accessibility properties to the view
public struct AccessibilityAttachmentModifier {
    let storage: MutableBox<AccessibilityAttachment>
    let behavior: AccessibilityChildBehavior?

    public init(storage: MutableBox<AccessibilityAttachment>, behavior: AccessibilityChildBehavior?) {
        self.storage = storage
        self.behavior = behavior
    }
}