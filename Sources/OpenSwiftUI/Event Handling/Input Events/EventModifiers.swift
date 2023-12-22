import Swift

/// A set of key modifiers that you can add to a gesture.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen 
public struct EventModifiers : OptionSet {
    
    // MARK: - Type Alias.
    
    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = EventModifiers

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = EventModifiers

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int

    // MARK: - Property(ies).

    /// The raw value.
    public let rawValue: Int
    
    // MARK: - Static Property(ies).
    
    /// The Caps Lock key.
    public static let capsLock: EventModifiers = .init(rawValue: 1)

    /// The Shift key.
    public static let shift: EventModifiers = .init(rawValue: 2)

    /// The Control key.
    public static let control: EventModifiers = .init(rawValue: 4)

    /// The Option key.
    public static let option: EventModifiers = .init(rawValue: 8)

    /// The Command key.
    public static let command: EventModifiers = .init(rawValue: 16)

    /// Any key on the numeric keypad.
    public static let numericPad: EventModifiers = .init(rawValue: 32)

    /// All possible modifier keys.
    public static let all: EventModifiers = .init(rawValue: 63)
    
    // MARK: - Constructor(s).

    /// Creates a new set from a raw value.
    ///
    /// - Parameter rawValue: The raw value with which to create the key
    ///   modifier.
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EventModifiers : Sendable {
}

extension EventModifiers : Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (_ a: EventModifiers, _ b: EventModifiers) -> Bool {
        a.rawValue == b.rawValue
    }
}

extension EventModifiers : Hashable {
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: In your implementation of `hash(into:)`,
    ///   don't call `finalize()` on the `hasher` instance provided,
    ///   or replace it with a different instance.
    ///   Doing so may become a compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}
