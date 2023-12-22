import Foundation

public struct WindowDefaultsPositionModifier : _SceneModifier {
    
    // MARK: - Property(ies).
    
    public let position: UnitPoint
    
    // MARK: - Constructor(s).
    
    public init(_ position: UnitPoint) {
        self.position = position
    }

    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> Never {
        fatalError()
    }
    
    // MARK: - Static Function(s).
    
    public static func _makeScene(modifier: _GraphValue<WindowDefaultsPositionModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        var output = _SceneOutputs()
        output.origin = modifier.value.position
        
        return output
    }
}
