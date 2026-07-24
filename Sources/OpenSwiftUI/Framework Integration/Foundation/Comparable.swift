import Foundation

extension Comparable {

    func clamp(min minValue: Self, max maxValue: Self) -> Self {
        min(max(minValue, self), maxValue)
    }

    mutating func clamp(to limits: ClosedRange<Self>) {
        self = self.clamp(
            min: limits.lowerBound, max: limits.upperBound)
    }

    func clamped(to limits: ClosedRange<Self>) -> Self {
        var result = self
        result.clamp(to: limits)
        return result
    }
}
