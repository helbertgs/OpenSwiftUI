import Foundation

/// A description of what should happen when the layout direction changes.
/// 
/// A ``LayoutDirectionBehavior`` can be used with the layoutDirectionBehavior view modifier or the layoutDirectionBehavior property of Shape.
public enum LayoutDirectionBehavior : Equatable, Hashable, Sendable {

    // MARK: - Getting behaviors

    /// A behavior that doesn’t mirror when the layout direction changes.
    case fixed

    /// A behavior that mirrors when the layout direction has the specified value.
    case mirrors(in: LayoutDirection)

    /// A behavior that mirrors when the layout direction is right-to-left.
    static var mirrors: LayoutDirectionBehavior {
        .mirrors(in: .rightToLeft)
    }
}