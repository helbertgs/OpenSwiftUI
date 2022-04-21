import Swift

/// The contrast between the app's foreground and background colors.
///
/// You receive a contrast value when you read the
/// ``EnvironmentValues/colorSchemeContrast`` environment value. The value
/// tells you if a standard or increased contrast currently applies to the view.
/// OpenSwiftUI updates the value whenever the contrast changes, and redraws
/// views that depend on the value. For example, the following ``Text`` view
/// automatically updates when the user enables increased contrast:
///
///     @Environment(\.colorSchemeContrast) private var colorSchemeContrast
///
///     var body: some View {
///         Text(colorSchemeContrast == .standard ? "Standard" : "Increased")
///     }
///
/// The user sets the contrast by selecting the Increase Contrast option in
/// Accessibility > Display in System Preferences on macOS, or
/// Accessibility > Display & Text Size in the Settings app on iOS.
/// Your app can't override the user's choice. For
/// information about using color and contrast in your app, see
/// [Color and Contrast](https://developer.apple.com/design/human-interface-guidelines/accessibility/overview/color-and-contrast).
@frozen public enum ColorSchemeContrast : CaseIterable, Equatable, Hashable {

    // MARK: - Case(s).

    /// OpenSwiftUI displays views with standard contrast between the app's
    /// foreground and background colors.
    case standard

    /// OpenSwiftUI displays views with increased contrast between the app's
    /// foreground and background colors.
    case increased
}
