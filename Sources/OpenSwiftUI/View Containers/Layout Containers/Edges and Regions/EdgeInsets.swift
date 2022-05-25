import Swift

/// The inset distances for the sides of a rectangle.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10, *)
@frozen public struct EdgeInsets : Equatable {

    public var top: Float

    public var leading: Float

    public var bottom: Float

    public var trailing: Float

    @inlinable public init(top: Float, leading: Float, bottom: Float, trailing: Float) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }

    @inlinable public init() {
        self.init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: EdgeInsets, rhs: EdgeInsets) -> Bool {
        lhs.top == rhs.top && lhs.leading == rhs.leading && lhs.bottom == rhs.bottom && lhs.trailing == rhs.trailing
    }
}
