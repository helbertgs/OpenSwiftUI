import Swift

@frozen public struct _ConditionalContent<TrueContent, FalseContent> : View where TrueContent: View, FalseContent: View {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    @usableFromInline let storage: Storage
    public var body: Never { fatalError() }

    // MARK: - Constructor(s).

    @usableFromInline init(storage: Storage) {
        self.storage = storage
    }

    // MARK: - Internal Structure(s).

    @usableFromInline @frozen enum Storage {
        case trueContent(TrueContent)
        case falseContent(FalseContent)
    }
}
