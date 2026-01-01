import Swift

/// A custom attribute that constructs a widget bundle’s body.
@frozen @resultBuilder public struct WidgetBundleBuilder {
    public static func buildBlock() -> some Widget {
        EmptyWidget()
    }
}
