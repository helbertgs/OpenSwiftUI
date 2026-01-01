import Swift

/// A structure that contains a point in a two-dimensional coordinate system.
@frozen
public struct Point: Codable, Equatable, Hashable {

    // MARK: - Public Property(ies).

    /// The x-coordinate of the point.
    public var x: Float

    /// The y-coordinate of the point.
    public var y: Float

    // MARK: - Static Property(ies).

    /// The point whose x and y are both zero.
    public static let zero = Point()

    // MARK: - Public Constructor(s).

    /// Creates a point with coordinates specified as floating-point values.
    @inlinable public init(x: Float = 0, y: Float = 0) {
        self.x = x
        self.y = y
    }

    /// Creates a point with coordinates specified as integer values.
    @inlinable public init(x: Int, y: Int) {
        self.x = Float(x)
        self.y = Float(y)
    }

    // MARK: - Equatable.

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
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
        hasher.combine(x)
        hasher.combine(y)
    }
}
