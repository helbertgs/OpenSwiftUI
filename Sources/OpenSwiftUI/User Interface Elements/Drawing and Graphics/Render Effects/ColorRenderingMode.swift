import SwiftUI

/// The set of possible working color spaces for color-compositing operations.
///
/// Each color space guarantees the preservation of a particular range of color
/// values.
public enum ColorRenderingMode : String, Equatable, Hashable {

    // MARK: - Case(s).

    /// The non-linear sRGB working color space.
    ///
    /// Color component values outside the range `[0, 1]` produce undefined
    /// results. This color space is gamma corrected.
    case nonLinear

    /// The linear sRGB working color space.
    ///
    /// Color component values outside the range `[0, 1]` produce undefined
    /// results. This color space isn't gamma corrected.
    case linear

    /// The extended linear sRGB working color space.
    ///
    /// Color component values outside the range `[0, 1]` are preserved.
    /// This color space isn't gamma corrected.
    case extendedLinear

    // MARK: - Equatable.

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ColorRenderingMode, b: ColorRenderingMode) -> Bool {
        a.rawValue == b.rawValue
    }

    // MARK: - Hashable.

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}
