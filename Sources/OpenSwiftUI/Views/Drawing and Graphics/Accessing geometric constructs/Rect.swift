import Swift

/// A structure that contains the location and dimensions of a rectangle.
@frozen
public struct Rect: Codable, Equatable, Hashable {

    // MARK: - Public Property(ies).

    /// A point that specifies the coordinates of the rectangle’s origin.
    public var origin: Point

    /// A size that specifies the height and width of the rectangle.
    public var size: Size

    // MARK: - Static Property(ies).

    public static let zero = Rect()

    // MARK: - Public Constructor(s).

    /// Creates a rectangle with the specified origin and size.
    @inlinable public init(origin: Point = .zero, size: Size = .zero) {
        self.origin = origin
        self.size = size
    }

    /// Creates a rectangle with coordinates and dimensions specified as floating-point values.
    @inlinable public init(x: Float, y: Float, width: Float, height: Float) {
        self.origin = .init(x: x, y: y)
        self.size = .init(width: width, height: height)
    }

    /// Creates a rectangle with coordinates and dimensions specified as integer values.
    @inlinable public init(x: Int, y: Int, width: Int, height: Int) {
        self.origin = .init(x: x, y: y)
        self.size = .init(width: width, height: height)
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
        lhs.origin == rhs.origin && lhs.size == rhs.size
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
        hasher.combine(origin)
        hasher.combine(size)
    }
}
