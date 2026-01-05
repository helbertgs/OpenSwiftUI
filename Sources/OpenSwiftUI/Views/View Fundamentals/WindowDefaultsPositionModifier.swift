import Foundation

public struct WindowDefaultsPositionModifier : @MainActor SceneModifier {
    
    // MARK: - Property(ies).
    
    public let position: UnitPoint
    
    // MARK: - Constructor(s).
    
    public init(_ position: UnitPoint) {
        self.position = position
    }

    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }
    
    // MARK: - Static Function(s).
    
    public static func _makeScene(modifier: _GraphValue<WindowDefaultsPositionModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        var outputs = _SceneOutputs()
        outputs.type = Self.self
        outputs.modifiers = inputs.modifiers
        outputs.modifiers.append(modifier.value)

        return outputs
    }
}
