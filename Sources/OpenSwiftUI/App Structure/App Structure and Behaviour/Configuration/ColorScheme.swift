import Swift

@frozen public enum ColorScheme : CaseIterable, Equatable, Hashable {

    // MARK: - Case(s).

    /// The color scheme that corresponds to a light appearance.
    case dark

    /// The color scheme that corresponds to a dark appearance.
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
