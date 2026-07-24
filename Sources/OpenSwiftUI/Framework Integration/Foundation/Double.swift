import Foundation

extension Double : VectorArithmetic {
    public func scaled(by rhs: Double) -> Double {
        self * rhs
    }

    public mutating func interpolate(towards other: Double, amount: Double) {
        fatalError("not implemented yet")
    }

    public func interpolated(towards other: Double, amount: Double) -> Double {
        fatalError("not implemented yet")
    }

  public mutating func scale(by rhs: Double) { self *= Double(rhs) }
  public var magnitudeSquared: Double {
      Double(self * self)
  }
}

extension Double {

  mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf m: Self) {
        if m == 1 {
            round(rule)
        } else {
            self /= m
            round(rule)
            self *= m
        }
    }

    mutating func round(toMultipleOf m: Self) {
        round(.toNearestOrAwayFromZero, toMultipleOf: m)
    }

    func rounded(_ rule: FloatingPointRoundingRule, toMultipleOf m: Self) -> Self {
        var r = self
        r.round(rule, toMultipleOf: m)
        return r
    }

    func rounded(toMultipleOf m: Self) -> Self {
        rounded(.toNearestOrAwayFromZero, toMultipleOf: m)
    }

    mutating func roundToNearestOrUp(toMultipleOf m: Self) {
        self += m / 2
        round(.down, toMultipleOf: m)
    }

    func roundedToNearestOrUp(toMultipleOf m: Self) -> Self {
        var r = self
        r.roundToNearestOrUp(toMultipleOf: m)
        return r
    }

    func approximates(_ value: Self, epsilon: Self) -> Swift.Bool {
        abs(self - value) < epsilon
    }
}
