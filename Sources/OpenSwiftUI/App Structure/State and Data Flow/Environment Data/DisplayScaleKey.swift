import Swift

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10, *)
public struct DisplayScaleKey : EnvironmentKey {
    public static var defaultValue: Float {
        0
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 10, *)
extension EnvironmentValues {
    /// The display scale of this environment.
    var displayScale: Float {
        get { self[DisplayScaleKey.self] }
        set { self[DisplayScaleKey.self] = newValue }
    }

    /// The size of a pixel on the screen.
    ///
    /// This value is usually equal to `1` divided by
    /// ``EnvironmentValues/displayScale``.
    var pixelLength : Float {
        1.0 / displayScale
    }
}
