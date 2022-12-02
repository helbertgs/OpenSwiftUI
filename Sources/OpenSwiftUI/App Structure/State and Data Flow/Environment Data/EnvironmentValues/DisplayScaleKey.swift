import Swift

public struct DisplayScaleKey : EnvironmentKey {
    public static var defaultValue: Float {
        0
    }
}

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
