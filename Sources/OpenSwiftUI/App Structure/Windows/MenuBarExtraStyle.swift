import Swift

/// A specification for the appearance and behavior of a menu bar extra scene.
public protocol MenuBarExtraStyle {
}

/// A menu bar extra style that renders its contents in a popover-like window.
///
/// Use ``MenuBarExtraStyle/window`` to construct this style.
public struct WindowMenuBarExtraStyle : MenuBarExtraStyle {

    /// Creates a window menu bar extra style.
    public init() { }
}

extension MenuBarExtraStyle where Self == WindowMenuBarExtraStyle {

    /// A menu bar extra style that renders its contents in a popover-like
    /// window.
    ///
    /// The styling and layout of controls is similar to that when contained
    /// in a normal window, compared to the menu-like layout that the
    /// ``MenuBarExtraStyle/menu`` style provides.
    public static var window: WindowMenuBarExtraStyle { .init() }
}

/// A menu bar extra style that renders its contents as a menu that pulls
/// down from the icon in the menu bar.
///
/// Use ``MenuBarExtraStyle/menu`` to construct this style.
public struct PullDownMenuBarExtraStyle : MenuBarExtraStyle {

    /// Creates a pull down menu bar extra style.
    public init() {
    }
}

extension MenuBarExtraStyle where Self == PullDownMenuBarExtraStyle {

    /// A menu bar extra style that renders its contents as a menu that pulls
    /// down from the icon in the menu bar.
    public static var menu: PullDownMenuBarExtraStyle { .init() }
}

/// The default menu bar extra style.
/// You can also use ``MenuBarExtraStyle/automatic`` to construct this style.
public struct AutomaticMenuBarExtraStyle : MenuBarExtraStyle {

    /// Creates an automatic menu bar extra style.
    public init() {
    }
}

extension MenuBarExtraStyle where Self == AutomaticMenuBarExtraStyle {

    /// The default menu bar extra style.
    public static var automatic: AutomaticMenuBarExtraStyle { .init() }
}
