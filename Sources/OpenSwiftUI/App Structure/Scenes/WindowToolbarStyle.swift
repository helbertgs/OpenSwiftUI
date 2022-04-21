import Swift

/// A specification for the appearance and behavior of a window’s toolbar.
public protocol WindowToolbarStyle { }

/// The default window toolbar style.
public struct DefaultWindowToolbarStyle : WindowToolbarStyle { }

/// A window toolbar style which displays its title bar area above the toolbar.
public struct ExpandedWindowToolbarStyle : WindowToolbarStyle { }

/// A window toolbar style which displays its toolbar and title bar inline.
public struct UnifiedWindowToolbarStyle : WindowToolbarStyle { }

/// A window toolbar style similar to unified, but with a more compact vertical sizing
public struct UnifiedCompactWindowToolbarStyle : WindowToolbarStyle { }

extension WindowToolbarStyle where Self == DefaultWindowToolbarStyle {
    /// The default window toolbar style.
    public static var automatic: DefaultWindowToolbarStyle { .init() }
}

extension WindowToolbarStyle where Self == ExpandedWindowToolbarStyle {
    /// A window toolbar style which displays its title bar area above the toolbar.
    public static var expanded: ExpandedWindowToolbarStyle { .init() }
}

extension WindowToolbarStyle where Self == UnifiedWindowToolbarStyle {
    /// A window toolbar style which displays its toolbar and title bar inline.
    public static var unified: UnifiedWindowToolbarStyle { .init() }
    /// A window toolbar style which displays its toolbar and title bar inline.
    public static func unified(showsTitle: Bool) -> UnifiedWindowToolbarStyle { .init() }
}

extension WindowToolbarStyle where Self == UnifiedCompactWindowToolbarStyle {
    /// A window toolbar style similar to unified, but with a more compact vertical sizing.
    public static var unifiedCompact: UnifiedCompactWindowToolbarStyle { .init() }
    /// A window toolbar style similar to unified, but with a more compact vertical sizing.
    public static func unifiedCompact(showsTitle: Bool) -> UnifiedCompactWindowToolbarStyle { .init() }
}
