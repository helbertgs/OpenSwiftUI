import Foundation

struct AccessibilityLargeContentViewerEnabledKey : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the Large Content Viewer is enabled.
    /// The system can automatically provide a large content view with accessibilityShowsLargeContentViewer() or you can provide your own with accessibilityShowsLargeContentViewer(_:).
    /// While it is not necessary to check this value before adding a large content view, it may be helpful if you need to adjust the behavior of a gesture. 
    /// For example, a button with a long press handler might increase its long press duration so the user can read the text in the large content viewer first.
    var accessibilityLargeContentViewerEnabled : Bool {
        get { self[AccessibilityLargeContentViewerEnabledKey.self] }
        set { self[AccessibilityLargeContentViewerEnabledKey.self] = newValue }
    }
}