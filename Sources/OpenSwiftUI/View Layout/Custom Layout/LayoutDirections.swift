import Swift

/// A direction in which SwiftUI can lay out content.
///
/// SwiftUI supports both left-to-right and right-to-left directions
/// for laying out content to support different languages and locales.
/// The system sets the value based on the user's locale, but
/// you can also use the ``View/environment(_:_:)`` modifier
/// to override the direction for a view and its child views:
///
///     MyView()
///         .environment(\.layoutDirection, .rightToLeft)
///
/// You can also read the ``EnvironmentValues/layoutDirection`` environment
/// value to find out which direction applies to a particular environment.
/// However, in many cases, you don't need to take any action based on this
/// value. SwiftUI horizontally flips the x position of each view within its
/// parent, so layout calculations automatically produce the desired effect
/// for both modes without any changes.
public enum LayoutDirection : Hashable, CaseIterable, Sendable {

    /// A left-to-right layout direction.
    case leftToRight

    /// A right-to-left layout direction.
    case rightToLeft
}