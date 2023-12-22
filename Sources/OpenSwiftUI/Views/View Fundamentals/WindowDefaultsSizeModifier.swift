import Foundation

public struct WindowDefaultsSizeModifier : _SceneModifier {
    
    // MARK: - Property(ies).
    
    public let width: Float
    public let height: Float
    
    // MARK: - Constructor(s).
    
    public init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> Never {
        fatalError()
    }
    
    // MARK: - Static Function(s).
    
    public static func _makeScene(modifier: _GraphValue<WindowDefaultsSizeModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        var output = _SceneOutputs()
        output.size = Size(
                width: modifier.value.width,
                height: modifier.value.height
            )
        
        return output
    }
}
