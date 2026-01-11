import Foundation

public struct WindowDefaultsSizeModifier : @MainActor SceneModifier {
    
    // MARK: - Property(ies).
    
    public let width: Double
    public let height: Double
    
    // MARK: - Constructor(s).
    
    public init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }
    
    // MARK: - Static Function(s).
    
    public static func _makeScene(modifier: _GraphValue<WindowDefaultsSizeModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        fatalError("not implemented yet")
    }
}
