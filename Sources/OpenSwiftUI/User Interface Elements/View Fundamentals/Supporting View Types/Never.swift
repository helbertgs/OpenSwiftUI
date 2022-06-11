import Swift

extension Never {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never { fatalError() }
}

extension Never : Commands { }
extension Never : View { }
extension Never : WidgetConfiguration { }
extension Never : Widget { }

extension Never : Scene {
    public static func _makeScene(scene: _GraphValue<Never>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError()
    }
}
