import Foundation

/// An option set that defines the functionality of a view’s direct touch area.
public struct AccessibilityDirectTouchOptions: Equatable, OptionSet, Sendable {

    // MARK: - Element

    public var rawValue: Int

    // MARK: - Getting the options

    /// Prevents touch passthrough with the direct touch area until an assistive technology, such as VoiceOver, has activated the direct touch area through a user action, for example a double tap.
    public static let requiresActivation: AccessibilityDirectTouchOptions = .init(rawValue: 1)

    /// Allows a direct touch area to immediately receive touch events without an assitive technology, such as VoiceOver, speaking. Appropriate for apps that provide direct audio feedback on touch that would conflict with speech feedback.
    public static let silentOnTouch: AccessibilityDirectTouchOptions = .init(rawValue: 2)

    // MARK: - Creating a set of options
    
    /// Create a set of direct touch options
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}