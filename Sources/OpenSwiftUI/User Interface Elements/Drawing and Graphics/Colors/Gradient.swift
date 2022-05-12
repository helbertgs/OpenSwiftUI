import Swift

/// A color gradient represented as an array of color stops, each having a
/// parametric location value.
@frozen public struct Gradient : Equatable {

    /// One color stop in the gradient.
    @frozen public struct Stop : Equatable {

        /// The color for the stop.
        public var color: Color

        /// The parametric location of the stop.
        ///
        /// This value must be in the range `[0, 1]`.
        public var location: Float

        /// Creates a color stop with a color and location.
        @inlinable public init(color: Color, location: Float) {
            self.color = color
            self.location = location
        }

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        @inlinable public static func == (lhs: Gradient.Stop, rhs: Gradient.Stop) -> Bool {
            lhs.color == rhs.color && lhs.location == rhs.location
        }
    }

    /// The array of color stops.
    public var stops: [Gradient.Stop]

    /// Creates a gradient from an array of color stops.
    public init(stops: [Gradient.Stop]) {
        self.stops = stops
    }

    /// Creates a gradient from an array of colors.
    ///
    /// The gradient synthesizes its location values to evenly space the colors
    /// along the gradient.
    public init(colors: [Color]) {
        self.stops = colors.compactMap { .init(color: $0, location: 1.0 / Float(colors.count)) }
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Gradient, rhs: Gradient) -> Bool {
        lhs.stops == rhs.stops
    }
}
