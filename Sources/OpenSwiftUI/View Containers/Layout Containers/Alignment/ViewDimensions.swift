import Swift

/// A view's size and its alignment guides in its own coordinate space.
@frozen public struct ViewDimensions : Equatable, Hashable {

    // MARK: - Public Property(ies).

    /// The view's width.
    @inlinable public var width: Float { 0 }

    /// The view's height.
    @inlinable public var height: Float { 0 }

    // MARK: - Subscript(s).
    /// Gets the value of the given horizontal guide.
    @inlinable public subscript(guide: HorizontalAlignment) -> Float { 0 }

    /// Gets the value of the given vertical guide.
    @inlinable public subscript(guide: VerticalAlignment) -> Float { 0 }

    /// Gets the explicit value of the given alignment guide in this view, or
    /// `nil` if no such value exists.
    @inlinable public subscript(explicit guide: HorizontalAlignment) -> Float? { nil }

    /// Gets the explicit value of the given alignment guide in this view, or
    /// `nil` if no such value exists.
    @inlinable public subscript(explicit guide: VerticalAlignment) -> Float? { 0 }

    // MARK: - Equatable.
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func == (lhs: ViewDimensions, rhs: ViewDimensions) -> Bool {
        lhs.height == rhs.height && lhs.width == rhs.width
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
        hasher.combine(width)
        hasher.combine(height)
    }
}
