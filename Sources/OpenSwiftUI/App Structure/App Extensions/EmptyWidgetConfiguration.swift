import Swift

/// An empty widget configuration.
@frozen public struct EmptyWidgetConfiguration : WidgetConfiguration {

    // MARK: - Associated Type(s).

    /// The type of widget configuration representing the body of this configuration.
    /// When you create a custom widget, Swift infers this type from your implementation of the required body property.
    public typealias Body = Never

    // MARK: - Property(ies).

    /// The content and behavior of the widget.
    public var body : Never {
        fatalError()
    }

    // MARK: - Constructor(s).

    @inlinable public init() { }
}
