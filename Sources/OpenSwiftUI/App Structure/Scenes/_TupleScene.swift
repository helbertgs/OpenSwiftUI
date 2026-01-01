import Swift

public struct _TupleScene<T> : Scene {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var value: T

    public var body: Never {
        fatalError()
    }

    // MARK: - Constructor(s).

    public init(_ value: T) {
        self.value = value
    }

    // MARK: - Static Function(s).

    public static func _makeScene(scene: _GraphValue<_TupleScene<T>>, inputs: _SceneInputs) -> _SceneOutputs {
        let mirror = Mirror(reflecting: scene.value.value)
        var outputs = _SceneOutputs()
        outputs.type = Self.self
        outputs.scene = scene.value

        for child in mirror.children {
            guard let childScene = child.value as? any Scene else {
                continue
            }

            func build<V>(_ scene: V, inputs: _SceneInputs) -> _SceneOutputs where V : Scene {
                V._makeScene(scene: _GraphValue(scene), inputs: inputs)
            }

            let output = build(childScene, inputs: inputs)
            outputs.children.append(output)
        }

        return outputs
    }
}
