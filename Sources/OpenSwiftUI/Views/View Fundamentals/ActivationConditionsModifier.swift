import Foundation

@frozen
public struct ActivationConditionsModifier : _SceneModifier {
    
    // MARK: - Property(ies).
    
    public let conditions: Set<String>
    
    // MARK: - Constructor(s).
    
    public init(conditions: Set<String>) {
        self.conditions = conditions
    }
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> some Scene {
        fatalError()
    }
    
    // MARK: - Static Function(s).
    
    public static func _makeScene(modifier: _GraphValue<ActivationConditionsModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        .init(props: [
            "activationConditionsModifier" : modifier.value.conditions
        ])
    }
}
