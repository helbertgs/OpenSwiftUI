import Swift

public protocol App {

    // MARK: - Associated Type(s).

    associatedtype Body : Scene

    // MARK: - Property(ies).

    var body: Self.Body { get }

    // MARK: - Constructor(s).

    init()

    // MARK: - Static Function(s).

    static func main()
}
