import Swift

@frozen
public struct _AppearanceActionModifier : ViewModifier {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).
    
    public let appear: (() -> Void)?
    public let disappear: (() -> Void)?
    
    // MARK: - Constructor(s).
    
    @inlinable
    public init(appear: (() -> Void)? = nil, disappear: (() -> Void)? = nil) {
        self.appear = appear
        self.disappear = disappear
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }
}
