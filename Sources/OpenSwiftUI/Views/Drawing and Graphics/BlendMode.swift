import Swift

/// Modes for compositing a view with overlapping content.
@frozen public enum BlendMode : String, Equatable, Hashable {

    // MARK: - Getting the Default

    case normal

    // MARK: - Darkening

    case darken
    case multiply
    case colorBurn
    case plusDarker

    // MARK: - Lightening

    case lighten
    case screen
    case colorDodge
    case plusLighter

    // MARK: - Adding Contrast

    case overlay
    case softLight
    case hardLight

    // MARK: - Inverting

    case difference
    case exclusion

    // MARK: - Mixing Color Components

    case hue
    case saturation
    case color
    case luminosity

    // MARK: - Accessing Porter-Duff Modes

    case sourceAtop
    case destinationOver
    case destinationOut

    // MARK: - Equatable.

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func == (lhs: BlendMode, rhs: BlendMode) -> Bool {
        lhs.rawValue == rhs.rawValue
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
    @inlinable public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}
