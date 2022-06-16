import Swift

public struct ImageScaleKey : EnvironmentKey {
    public static var defaultValue: Image.Scale {
        .medium
    }
}

extension EnvironmentValues {
    /// The image scale for this environment.
    public var imageScale: Image.Scale {
        get { self[ImageScaleKey.self] }
        set { self[ImageScaleKey.self] = newValue }
    }
}
