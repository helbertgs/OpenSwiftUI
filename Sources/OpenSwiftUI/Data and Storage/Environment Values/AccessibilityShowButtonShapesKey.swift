import Swift

@frozen public struct AccessibilityShowButtonShapesKey : EnvironmentKey {
    public static var defaultValue: Bool {
        false
    }
}

extension EnvironmentValues {
    /// Whether the system preference for Show Button Shapes is enabled.
    /// If this property’s value is true, interactive custom controls such as buttons should be drawn in such a way that their edges and borders are clearly visible.
    /// 
    /// The default value is `false`.
    public var accessibilityShowButtonShapes: Bool {
        get { self[AccessibilityShowButtonShapesKey.self] }
    }
}
