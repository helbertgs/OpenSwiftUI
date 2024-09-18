import Foundation

/// A type that can serve as the animatable data of an animatable type.
///
/// VectorArithmetic extends the ``AdditiveArithmetic`` protocol with scalar multiplication and a way to query the vector magnitude of the value.
/// Use this type as the animatableData associated type of a type that conforms to the ``Animatable`` protocol.
public protocol VectorArithmetic : AdditiveArithmetic {

    // MARK: - Manipulating values

    /// Returns the dot-product of this vector arithmetic instance with itself.
    var magnitudeSquared: Double { get }

    /// Multiplies each component of this value by the given value.
    mutating func scale(by rhs: Double)

    /// Returns a value with each component of this value multiplied by the given value.
    func scaled(by rhs: Double) -> Self

    /// Interpolates this value with other by the specified amount.
    /// This is equivalent to self = self + (other - self) * amount.
    mutating func interpolate(towards other: Self, amount: Double)

    /// Returns this value interpolated with other by the specified amount.
    /// This result is equivalent to self + (other - self) * amount.
    func interpolated(towards other: Self, amount: Double) -> Self
}
