import Swift

/// Keyboard shortcuts describe combinations of keys on a keyboard that the user
/// can press in order to activate a button or toggle.
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct KeyboardShortcut : Sendable {
    
    // MARK: - Property(ies).
    
    /// The key equivalent that the user presses in conjunction with any
    /// specified modifier keys to activate the shortcut.
    public let key: KeyEquivalent

    /// The modifier keys that the user presses in conjunction with a key
    /// equivalent to activate the shortcut.
    public let modifiers: EventModifiers
    
    /// The localization strategy to apply to this shortcut.
    public let localization: KeyboardShortcut.Localization
    
    // MARK: - Static Property(ies).
    
    /// The standard keyboard shortcut for the default button, consisting of
    /// the Return (↩) key and no modifiers.
    ///
    /// On macOS, the default button is designated with special coloration. If
    /// more than one control is assigned this shortcut, only the first one is
    /// emphasized.
    public static let defaultAction: KeyboardShortcut = .init(.return)

    /// The standard keyboard shortcut for cancelling the in-progress action
    /// or dismissing a prompt, consisting of the Escape (⎋) key and no
    /// modifiers.
    public static let cancelAction: KeyboardShortcut = .init(.escape)
    
    // MARK: - Constructor(s).

    /// Creates a new keyboard shortcut with the given key equivalent and set of
    /// modifier keys.
    ///
    /// Use the `localization` parameter to specify a localization strategy
    /// for this shortcut.
    public init(_ key: KeyEquivalent, modifiers: EventModifiers = .command, localization: KeyboardShortcut.Localization = .automatic) {
        self.key = key
        self.modifiers = modifiers
        self.localization = localization
    }
}

extension KeyboardShortcut : Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: KeyboardShortcut, rhs: KeyboardShortcut) -> Bool {
        lhs.key == rhs.key &&
        lhs.localization == rhs.localization &&
        lhs.modifiers == rhs.modifiers
    }
}

extension KeyboardShortcut : Hashable {
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
        hasher.combine(self.key)
        hasher.combine(self.localization)
        hasher.combine(self.modifiers)
    }
}
