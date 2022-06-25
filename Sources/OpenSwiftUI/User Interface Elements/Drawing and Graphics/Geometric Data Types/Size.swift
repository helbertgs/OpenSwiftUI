@frozen
public struct Size: Codable, Equatable, Hashable {

    // MARK: - Public Property(ies).

    /// A width value.
    public var width: Float

    /// A height value.
    public var height: Float

    // MARK: - Static Property(ies).

    /// The size whose width and height are both zero.
    public static let zero = Size()

    // MARK: - Public Constructor(s).

    /// Creates a size with dimensions specified as floating-point values.
    @inlinable public init(width: Float = 0, height: Float = 0) {
        self.width = width
        self.height = height
    }

    /// Creates a size with dimensions specified as integer values.
    @inlinable public init(width: Int, height: Int) {
        self.width = Float(width)
        self.height = Float(height)
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
        lhs.width == rhs.width && lhs.height == rhs.height
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
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
    }
}
