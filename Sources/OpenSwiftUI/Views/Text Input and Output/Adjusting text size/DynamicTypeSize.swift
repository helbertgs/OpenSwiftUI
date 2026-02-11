import Foundation

/// A Dynamic Type size, which specifies how large scalable content should be.
public enum DynamicTypeSize: CaseIterable, Codable, Equatable, Hashable, Sendable {

    // MARK: - Getting type sizes
    
    /// An extra small size.
    case xSmall

    /// A small size.
    case small

    /// A medium size.
    case medium

    /// A large size.
    case large

    /// An extra large size.
    case xLarge

    /// An extra extra large size.
    case xxLarge

    /// An extra extra extra large size.
    case xxxLarge

    // MARK: - Getting accessibility type sizes

    /// The first accessibility size.
    case accessibility1

    /// The second accessibility size.
    case accessibility2

    /// The third accessibility size.
    case accessibility3

    /// The fourth accessibility size.
    case accessibility4

    /// The fifth accessibility size.
    case accessibility5

    /// A Boolean value indicating whether the size is one that is associated with accessibility.
    var isAccessibilitySize: Bool {
        return switch self {
            case .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5:
                true
            default:
                false
        }
    }
}