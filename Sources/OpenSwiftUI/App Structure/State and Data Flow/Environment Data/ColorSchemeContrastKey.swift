import Swift

@frozen public struct ColorSchemeContrastKey : EnvironmentKey {
    public static var defaultValue: ColorSchemeContrast {
        .standard
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func _valuesEqual(_ lhs: ColorSchemeContrast, _ rhs: ColorSchemeContrast) -> Bool {
        lhs == rhs
    }
}

extension EnvironmentValues {
    /// The contrast associated with the color scheme of this environment.
    ///
    /// Read this environment value from within a view to find out if OpenSwiftUI
    /// is currently displaying the view using ``ColorSchemeContrast/standard``
    /// or ``ColorSchemeContrast/increased`` contrast. The value that you read
    /// depends entirely on user settings, and you can't change it.
    ///
    ///     @Environment(\.colorSchemeContrast) private var colorSchemeContrast
    ///
    ///     var body: some View {
    ///         Text(colorSchemeContrast == .standard ? "Standard" : "Increased")
    ///     }
    ///
    /// When adjusting your app's user interface to match the contrast,
    /// consider also checking the ``EnvironmentValues/colorScheme`` property
    /// to find out if OpenSwiftUI is displaying the view with a light or dark
    /// appearance. For information about using color and contrast in your app,
    /// see [Color and Contrast](https://developer.apple.com/design/human-interface-guidelines/accessibility/overview/color-and-contrast/).
    ///
    /// > Note: If you only need to provide different colors or
    /// images for different color scheme and contrast settings, do that in
    /// your app's Asset Catalog. See
    /// <doc://com.apple.documentation/documentation/Xcode/Asset-Management>.
    public var colorSchemeContrast: ColorSchemeContrast {
        self[ColorSchemeContrastKey.self]
    }
}
