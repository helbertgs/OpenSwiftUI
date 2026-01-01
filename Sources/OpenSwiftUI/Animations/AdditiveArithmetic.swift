import Foundation

/// A type with values that support addition and subtraction.
public protocol AdditiveArithmetic : Equatable {

    // MARK: - Type Properties

    /// The zero value.
    ///
    /// Zero is the identity element for addition. For any value, x + .zero == x and .zero + x == x.
    static var zero: Self { get }

    // MARK: - Operators

    /// Returns the given number unchanged.
    ///
    /// You can use the unary plus operator (+) to provide symmetry in your code for positive numbers when also using the unary minus operator.
    /// - Returns: The given argument without any changes.
    static prefix func + (x: Self) -> Self

    /// Adds two values and produces their sum.
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func + (lhs: Self, rhs: Self) -> Self

    /// Adds two values and stores the result in the left-hand-side variable.
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    static func += (lhs: inout Self, rhs: Self)
    
    /// Subtracts one value from another and produces their difference.
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from lhs.
    static func - (lhs: Self, rhs: Self) -> Self
    
    /// Subtracts the second value from the first and stores the difference in the left-hand-side variable.
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from lhs.
    static func -= (lhs: inout Self, rhs: Self)
}
