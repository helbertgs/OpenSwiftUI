import Foundation

/// The structure that defines the kinds of available accessibility actions.
public enum AccessibilityActionKind : Equatable, Sendable {

    // MARK: - Getting the kind of action

    /// The value that represents the default accessibility action.
    case `default`
    
    /// The value that represents an accessibility action that dismisses a modal view or cancels an operation.
    case escape
}