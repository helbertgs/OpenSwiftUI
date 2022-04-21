import Swift

extension Never {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never { fatalError() }
}

extension Never : Scene { }
