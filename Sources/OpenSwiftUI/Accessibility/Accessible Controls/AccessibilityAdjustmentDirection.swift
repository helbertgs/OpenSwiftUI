import Foundation

/// A directional indicator you use when making an accessibility adjustment.
public enum AccessibilityAdjustmentDirection : Copyable, Equatable, Hashable, Sendable {

    // MARK: - Getting an adjustment direction

    case decrement
    case increment
}