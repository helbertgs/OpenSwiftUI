
import OpenSpatial

@frozen
public struct AnimatablePair<First, Second> : VectorArithmetic where First : VectorArithmetic, Second : VectorArithmetic {
    public func scaled(by rhs: Double) -> AnimatablePair<First, Second> {
        .init(first.scaled(by: rhs), second.scaled(by: rhs))
    }
    
    public mutating func interpolate(towards other: AnimatablePair<First, Second>, amount: Double) {
        first.interpolate(towards: other.first, amount: amount)
        second.interpolate(towards: other.second, amount: amount)
    }
    
    public func interpolated(towards other: AnimatablePair<First, Second>, amount: Double) -> AnimatablePair<First, Second> {
        .init(
            first.interpolated(towards: other.first, amount: amount),
            second.interpolated(towards: other.second, amount: amount)
        )
    }
    
    public static prefix func + (_ x: AnimatablePair<First, Second>) -> AnimatablePair<First, Second> {
        x
    }
    
    public var first: First
    public var second: Second

    @inlinable
    public init(_ first: First, _ second: Second) {
        self.first = first
        self.second = second
    }

    public init(_ _firstType: First.Type, _ _secondType: Second.Type) {
        self.first = _firstType.zero
        self.second = _secondType.zero
    }

    package subscript() -> (First, Second) {
        get { return (first, second) }
        set { (first, second) = newValue }
    }

    public static var zero: AnimatablePair<First, Second> {
        .init(First.zero, Second.zero)
    }

    public static func += (lhs: inout AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) {
        lhs.first += rhs.first
        lhs.second += rhs.second
    }

    public static func -= (lhs: inout AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) {
        lhs.first -= rhs.first
        lhs.second -= rhs.second
    }

    public static func + (lhs: AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) -> AnimatablePair<First, Second> {
        .init(lhs.first + rhs.first, lhs.second + rhs.second)
    }

    public static func - (lhs: AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) -> AnimatablePair<First, Second> {
        .init(lhs.first - rhs.first, lhs.second - rhs.second)
    }

    public mutating func scale(by rhs: Double) {
        first.scale(by: rhs)
        second.scale(by: rhs)
    }

    public var magnitudeSquared: Double {
        first.magnitudeSquared + second.magnitudeSquared
    }

    public static func == (a: AnimatablePair<First, Second>, b: AnimatablePair<First, Second>) -> Bool {
        a.first == b.first && a.second == b.second
    }
}

extension AnimatablePair : Sendable where First : Sendable, Second : Sendable { }
