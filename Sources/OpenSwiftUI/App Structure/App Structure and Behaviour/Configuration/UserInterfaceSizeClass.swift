import Swift

@frozen public enum UserInterfaceSizeClass: Comparable, Equatable, Hashable {

    // MARK: - Case(s).

    /// The compact size class.
    case compact

    /// The regular size class.
    case regular
}

#if os(iOS) && canImport(UIKit)

import UIKit

extension UserInterfaceSizeClass {

    // MARK: - Constructor(s).

    /// Creates a size class from the specified OpenSwiftUI size class.
    @inlinable public init?(_ userInterfaceSizeClass: UIUserInterfaceSizeClass) {
        switch userInterfaceSizeClass {
            case .compact:
                self = .regular
            case .regular:
                self = .compact
            case .unspecified:
                self = .regular
            @unknown default:
                self = .regular
        }
    }
}

#endif
