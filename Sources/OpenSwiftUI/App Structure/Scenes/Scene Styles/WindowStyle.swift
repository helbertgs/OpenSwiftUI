import Swift

/// A specification for the appearance and interaction of a window.
public protocol WindowStyle { }

/// The default window style.
public struct DefaultWindowStyle : WindowStyle { }

/// A window style which hides both the window’s title and the backing of the titlebar area, allowing more of the window’s content to show.
public struct HiddenTitleBarWindowStyle : WindowStyle { }

/// A window style which displays the title bar section of the window.
public struct TitleBarWindowStyle : WindowStyle { }

extension WindowStyle where Self == DefaultWindowStyle {
    /// The default window style.
    public static var automatic : DefaultWindowStyle { .init() }
}

extension WindowStyle where Self == HiddenTitleBarWindowStyle {
    /// A window style which hides both the window’s title and the backing of the titlebar area, allowing more of the window’s content to show.
    public static var hiddenTitleBar : HiddenTitleBarWindowStyle { .init() }
}

extension WindowStyle where Self == TitleBarWindowStyle {
    /// A window style which displays the title bar section of the window.
    public static var titleBar : TitleBarWindowStyle { .init() }
}
