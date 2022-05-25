import Swift

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, Windows 10, *)
public struct ImageScaleKey : EnvironmentKey {
    public static var defaultValue: Image.Scale {
        .medium
    }
}

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, Windows 10, *)
extension EnvironmentValues {
    /// The image scale for this environment.
    public var imageScale: Image.Scale {
        get { self[ImageScaleKey.self] }
        set { self[ImageScaleKey.self] = newValue }
    }
}
