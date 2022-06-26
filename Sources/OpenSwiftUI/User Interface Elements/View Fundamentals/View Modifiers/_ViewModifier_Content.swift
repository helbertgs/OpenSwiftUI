import Swift

public struct _ViewModifier_Content<Modifier> : View where Modifier: ViewModifier {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never { fatalError() }

    // MARK: - Static Function(s).

    public static func makeView(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
}
