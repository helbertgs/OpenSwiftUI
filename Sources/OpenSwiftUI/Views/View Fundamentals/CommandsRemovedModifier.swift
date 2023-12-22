import Foundation

@frozen
public struct CommandsRemovedModifier : _SceneModifier {
    
    // MARK: - Constructor(s).
    
    @inlinable
    public init() { }
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> some Scene {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<CommandsRemovedModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        .init(props: ["deleteAllCommands": true])
    }
}
