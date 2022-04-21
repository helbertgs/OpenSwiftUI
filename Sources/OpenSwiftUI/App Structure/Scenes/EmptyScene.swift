import Swift

@frozen public struct EmptyScene : Scene {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never { fatalError() }

    // MARK: - Constructor(s).

    @inlinable public init() { }
}
