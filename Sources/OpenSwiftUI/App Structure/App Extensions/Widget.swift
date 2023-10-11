import Swift

/// The configuration and content of a widget to display on the Home screen or in Notification Center.
public protocol Widget {

    // MARK: - Associated Type(s).

    /// The type of configuration representing the content of the widget.
    associatedtype Body: WidgetConfiguration

    // MARK: - Property(ies).

    /// The content and behavior of the widget.
    var body : Self.Body { get }

    // MARK: - Constructor(s).

    /// Creates a widget using body as its content.
    init()

    // MARK: - Static Function(s).

    /// Initializes and runs the widget.
    static func main()
}

extension Widget {

    /// Creates a widget using body as its content.
    public init() {
        fatalError()
    }

    /// Initializes and runs the widget.
    public static func main() { }
}
