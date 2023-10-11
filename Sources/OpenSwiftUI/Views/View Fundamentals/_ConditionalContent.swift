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

    // MARK: - Static Function(s).

    public static func _makeView(view: _GraphValue<_ConditionalContent<TrueContent, FalseContent>>, inputs: _ViewInputs) -> _ViewOutputs {
        switch view.value.storage {
            case .falseContent(let view):
                return FalseContent.Body._makeView(view: .init(view.body), inputs: inputs)
            case .trueContent(let view):
                return TrueContent.Body._makeView(view: .init(view.body), inputs: inputs)
        }
    }

    // MARK: - Internal Structure(s).

    @usableFromInline @frozen enum Storage {
        case trueContent(TrueContent)
        case falseContent(FalseContent)
    }
}
