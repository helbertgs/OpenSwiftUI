import Swift

/// A type that describes a widget’s content.
public protocol WidgetConfiguration {

    // MARK: - Associated Type(s).

    /// The type of widget configuration representing the body of this configuration.
    associatedtype Body: WidgetConfiguration

    // MARK: - Property(ies).

    /// The content and behavior of the widget.
    var body : Self.Body { get }
}
