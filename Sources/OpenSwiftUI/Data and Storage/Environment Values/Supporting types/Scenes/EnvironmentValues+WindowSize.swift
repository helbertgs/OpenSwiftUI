import OpenSpatial

private struct WindowSizeKey: EnvironmentKey {
    static let defaultValue: Size3D = .init(width: 900, height: 450, depth: 0)
}

extension EnvironmentValues {
    public var windowSize: Size3D {
        get { self[WindowSizeKey.self] }
        set { self[WindowSizeKey.self] = newValue }
    }
}
