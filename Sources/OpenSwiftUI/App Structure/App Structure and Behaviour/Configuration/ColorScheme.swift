import Swift

/// The possible types of color schemes, like Dark Mode.
///
/// The color scheme enumerates the user setting options for Light or Dark Mode.
/// It also provides the light or dark options for any particular view when the
/// app wants to override the user setting.
@frozen public enum ColorScheme: CaseIterable, Equatable, Hashable {

    // MARK: - Case(s).
    /// Dark mode.
    case dark

    /// Light mode
    case light
}

#if os(iOS) && canImport(UIKit)

import UIKit

extension ColorScheme {

    // MARK: - Constructor(s).

    /// Creates a color scheme from its user interface style equivalent.
    @inlinable public init?(_ userInterfaceStyle: UIUserInterfaceStyle) {
        switch userInterfaceStyle {
            case .dark:
                self = .dark
            case .light:
                self = .light
            case .unspecified:
                self = .light
            @unknown default:
                self = .light
        }
    }
}

#endif
