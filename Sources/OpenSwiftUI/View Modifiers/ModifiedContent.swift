import Swift

@frozen public struct ModifiedContent<Content, Modifier> {

    // MARK: - Property(ies).

    @usableFromInline let content: Content
    @usableFromInline let modifier: Modifier

    // MARK: - Constructor(s).

    @inlinable public init(_ content: Content, _ modifier: Modifier) {
        self.content = content
        self.modifier = modifier
    }
}

extension ModifiedContent : Scene where Content : Scene {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var body : Never { fatalError() }
}
