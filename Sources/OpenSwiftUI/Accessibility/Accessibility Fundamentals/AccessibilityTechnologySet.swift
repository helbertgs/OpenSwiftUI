import Foundation

@frozen public struct AccessibilityTechnologySet : OptionSet, CaseIterable, Equatable, Hashable {

    // MARK: - Static Property(ies).

    public static var voiceOver : AccessibilityTechnologySet = .init(rawValue: 1 << 0)
    public static var switchControl : AccessibilityTechnologySet = .init(rawValue: 1 << 1)

    // MARK: - Public Property(ies).

    public var rawValue: Int
    public static var allCases: [AccessibilityTechnologySet] = [.voiceOver, .switchControl]

    // MARK: - Constructor(s).

    @inlinable public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
