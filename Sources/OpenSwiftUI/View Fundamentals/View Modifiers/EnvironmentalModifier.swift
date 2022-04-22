import Swift

/// A modifier that must resolve to a concrete modifier in an environment before
/// use.
public protocol EnvironmentalModifier : ViewModifier where Self.Body == Never {

    // MARK: - Associated Type(s).

    /// The type of modifier to use after being resolved.
    associatedtype ResolvedModifier : ViewModifier

    // MARK: - Property(ies).

    static var _requiresMainThread: Swift.Bool { get }

    // MARK: - Function(s).

    /// Resolve to a concrete modifier in the given `environment`.
    func resolve(in environment: EnvironmentValues) -> Self.ResolvedModifier
}
