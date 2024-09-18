import Foundation

@frozen public struct AccessibilityTechnologySet : OptionSet, CaseIterable, Equatable, Hashable, Sendable {

    // MARK: - Static Property(ies).

    public static let voiceOver : AccessibilityTechnologySet = .init(rawValue: 1 << 0)
    public static let switchControl : AccessibilityTechnologySet = .init(rawValue: 1 << 1)

    // MARK: - Public Property(ies).

    public var rawValue: Int
    public static let allCases: [AccessibilityTechnologySet] = [.voiceOver, .switchControl]

    // MARK: - Constructor(s).

    @inlinable public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
