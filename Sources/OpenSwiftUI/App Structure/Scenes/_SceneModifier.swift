import Swift

public protocol _SceneModifier {

    // MARK: - Associated Type(s).

    associatedtype Body : Scene

    // MARK: - Type Alias.

    typealias SceneContent = _SceneModifier_Content<Self>

    // MARK: - Property(ies).

    @SceneBuilder func body(content: Self.SceneContent) -> Self.Body

    // MARK: - Static Function(s).

    static func _makeScene(modifier: _GraphValue<Self>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs
}

extension _SceneModifier {
    @inlinable internal func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(content: self, modifier: modifier)
    }
}

extension _SceneModifier where Self.Body == Never {
    public func body(content: Self.SceneContent) -> Self.Body {
        content.body
    }
}

extension _SceneModifier where Self : _GraphInputsModifier, Self.Body == Never {
    static func _makeScene(modifier: _GraphValue<Self>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        fatalError()
    }
}
