import Swift

/// The contrast between the app's forerground and background colors.
@frozen public enum ColorSchemeContrast : CaseIterable, Equatable, Hashable {

    // MARK: - Case(s).

    /// SwiftUI displays views with standard contrast between the app's foreground and background colors.
    case standard

    /// SwiftUI displays views with increased contrast between the app's foreground and background colors.
    case increased
}
