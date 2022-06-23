import Swift

@usableFromInline
internal struct _TupleScene<T> : Scene {

    // MARK: - Type Alias.

    @usableFromInline
    internal typealias Body = Never

    // MARK: - Property(ies).

    @usableFromInline
    internal var value: T

    @usableFromInline
    internal var body: Swift.Never {
        fatalError()
    }

    // MARK: - Constructor(s).

    @usableFromInline
    internal init(_ value: T) {
        self.value = value
    }

    // MARK: - Static Function(s).

    @usableFromInline
    internal static func _makeScene(scene: _GraphValue<_TupleScene<T>>, inputs: _SceneInputs) -> _SceneOutputs {
        var outputs = _SceneOutputs()
        var scenes = [_SceneOutputs]()

        for child in Mirror(reflecting: scene.value.value).children {
            let scene = child.value as! (any Scene)
            scenes.append(_makeScene(scene: scene, inputs: inputs))
        }

        outputs.scenes = scenes
        return outputs
    }

    internal static func _makeScene<T>(scene: T, inputs: _SceneInputs) -> _SceneOutputs where T: Scene {
        T._makeScene(scene: _GraphValue(scene), inputs: inputs)
    }
}
