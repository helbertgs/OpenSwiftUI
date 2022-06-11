import Swift

@available(iOS 14.0, macOS 10.15, tvOS 14.0, watchOS 7.0, Windows 10, *)
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

@available(iOS 14.0, macOS 10.15, tvOS 14.0, watchOS 7.0, Windows 10, *)
extension _SceneModifier {
    @inlinable internal func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(content: self, modifier: modifier)
    }
}

@available(iOS 14.0, macOS 10.15, tvOS 14.0, watchOS 7.0, Windows 10, *)
extension _SceneModifier where Self.Body == Never {
    public func body(content: Self.SceneContent) -> Self.Body {
        content.body
    }
}

@available(iOS 14.0, macOS 10.15, tvOS 14.0, watchOS 7.0, Windows 10, *)
extension _SceneModifier where Self : _GraphInputsModifier, Self.Body == Never {
    static func _makeScene(modifier: _GraphValue<Self>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        fatalError()
    }
}
