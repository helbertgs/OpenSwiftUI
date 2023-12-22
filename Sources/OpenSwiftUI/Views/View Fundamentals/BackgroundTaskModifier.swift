import Swift

@frozen
public struct BackgroundTaskModifier<Request, Response> : _SceneModifier {
    
    // MARK: - Property(ies).
    public let task: BackgroundTask<Request, Response>
    public let storage: Any
    
    // MARK: - Constructor(s).
    
    @inlinable public init(task: BackgroundTask<Request, Response>, storage: Any) {
        self.task = task
        self.storage = storage
    }
    
    // MARK: - Function(s).
    
    public func body(content: SceneContent) -> some Scene {
        fatalError()
    }
    
    public static func _makeScene(modifier: _GraphValue<BackgroundTaskModifier<Request, Response>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        .init(props: [
            "backgroundTask": modifier.value.task,
            "backgroundTaskStorage": modifier.value.storage
        ])
    }
}

