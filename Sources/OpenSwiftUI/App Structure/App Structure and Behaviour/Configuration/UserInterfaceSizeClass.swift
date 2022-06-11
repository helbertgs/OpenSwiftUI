import Swift

/// A set of values that indicate the visual size available to the view.
///
/// You receive a size class value when you read either the
/// ``EnvironmentValues/horizontalSizeClass`` or
/// ``EnvironmentValues/verticalSizeClass`` environment value. The value tells
/// you about the amount of space available to your views in a given
/// direction. You can read the size class like any other of the
/// ``EnvironmentValues``, by creating a property with the ``Environment``
/// property wrapper:
///
///     @Environment(\.horizontalSizeClass) private var horizontalSizeClass
///     @Environment(\.verticalSizeClass) private var verticalSizeClass
///
/// OpenSwiftUI sets the size class based on several factors, including:
///
/// * The current device type.
/// * The orientation of the device.
/// * The appearance of Slide Over and Split View on iPad.
///
/// Several built-in views change their behavior based on the size class.
/// For example, a ``NavigationView`` presents a multicolumn view when
/// the horizontal size class is ``UserInterfaceSizeClass/regular``,
/// but a single column otherwise. You can also adjust the appearance of
/// custom views by reading the size class and conditioning your views.
/// If you do, be prepared to handle size class changes while
/// your app runs, because factors like device orientation can change at
/// runtime.
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
