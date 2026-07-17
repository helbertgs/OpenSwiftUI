import Foundation
import OpenSpatial

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
    
    public static func _makeScene(modifier: _GraphValue<WindowDefaultsPositionModifier>, inputs: _SceneInputs) -> _SceneOutputs {
        var outputs = _SceneOutputs(inputs: inputs)
        outputs.placement = WindowPlacement(modifier.value.position, size: outputs.size)
        outputs.position = Point3D(
            x: modifier.value.position.x,
            y: modifier.value.position.y
        )
        return outputs
    }
}
