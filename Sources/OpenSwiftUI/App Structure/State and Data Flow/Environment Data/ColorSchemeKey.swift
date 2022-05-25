import Swift

@frozen public struct ColorSchemeKey : EnvironmentKey {
    public static var defaultValue: ColorScheme {
        .light
    }
}

extension EnvironmentValues {
    /// The color scheme of this environment.
    ///
    /// Read this environment value from within a view to find out if OpenSwiftUI
    /// is currently displaying the view using the ``ColorScheme/light`` or
    /// ``ColorScheme/dark`` appearance. The value that you receive depends on
    /// whether the user has enabled Dark Mode, possibly superseded by
    /// the configuration of the current presentation's view hierarchy.
    ///
    ///     @Environment(\.colorScheme) private var colorScheme
    ///
    ///     var body: some View {
    ///         Text(colorScheme == .dark ? "Dark" : "Light")
    ///     }
    ///
    /// You can set the `colorScheme` environment value directly,
    /// but that usually isn't what you want. Doing so changes the color
    /// scheme of the given view and its child views but *not* the views
    /// above it in the view hierarchy. Instead, set a color scheme using the
    /// ``View/preferredColorScheme(_:)`` modifier, which also propagates the
    /// value up through the view hierarchy to the enclosing presentation, like
    /// a sheet or a window.
    ///
    /// When adjusting your app's user interface to match the color scheme,
    /// consider also checking the ``EnvironmentValues/colorSchemeContrast``
    /// property, which reflects a system-wide contrast setting that the user
    /// controls. For information about using color and contrast in your app,
    /// see [Color and Contrast](https://developer.apple.com/design/human-interface-guidelines/accessibility/overview/color-and-contrast/).
    ///
    /// > Note: If you only need to provide different colors or
    /// images for different color scheme and contrast settings, do that in
    /// your app's Asset Catalog. See
    /// <doc://com.apple.documentation/documentation/Xcode/Asset-Management>.
    public var colorScheme: ColorScheme {
        get { self[ColorSchemeKey.self] }
        set { self[ColorSchemeKey.self] = newValue }
    }
}
