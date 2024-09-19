import Foundation

/// A set of accessibility traits that describe how an element behaves.
public struct AccessibilityTraits: Sendable {

    // MARK: - Getting traits

    /// The accessibility element allows direct touch interaction for VoiceOver users.
    public static let allowsDirectInteraction: AccessibilityTraits = .init()

    /// The accessibility element causes an automatic page turn when VoiceOver finishes reading the text within it.
    public static let causesPageTurn: AccessibilityTraits = .init()

    /// The accessibility element is a button.
    public static let isButton: AccessibilityTraits = .init()

    /// The accessibility element is a header that divides content into sections, like the title of a navigation bar.
    public static let isHeader: AccessibilityTraits = .init()

    /// The accessibility element is an image.
    public static let isImage: AccessibilityTraits = .init()

    /// The accessibility element behaves as a keyboard key.
    public static let isKeyboardKey: AccessibilityTraits = .init()

    /// The accessibility element is a link.
    public static let isLink: AccessibilityTraits = .init()

    /// The accessibility element is modal.
    public static let isModal: AccessibilityTraits = .init()

    /// The accessibility element is a search field.
    public static let isSearchField: AccessibilityTraits = .init()

    /// The accessibility element is currently selected.
    public static let isSelected: AccessibilityTraits = .init()

    /// The accessibility element is a static text that cannot be modified by the user.
    public static let isStaticText: AccessibilityTraits = .init()

    /// The accessibility element provides summary information when the application starts.
    public static let isSummaryElement: AccessibilityTraits = .init()

    /// The accessibility element is a toggle.
    public static let isToggle: AccessibilityTraits = .init()

    /// The accessibility element plays its own sound when activated.
    public static let playsSound: AccessibilityTraits = .init()

    /// The accessibility element starts a media session when it is activated.
    public static let startsMediaSession: AccessibilityTraits = .init()

    /// The accessibility element frequently updates its label or value.
    public static let updatesFrequently: AccessibilityTraits = .init()

    // MARK: - Type Properties

    /// The accessibility element is a tab bar
    public static let isTabBar: AccessibilityTraits = .init()
}