import Swift

@frozen public struct Transaction {
    
    // MARK: - Property(ies).
    
    @usableFromInline var animation: Animation?
    @usableFromInline var disableAnimations: Bool
    
    // MARK: - Constructor(s).
    
    @inlinable public init(animation: Animation?, disableAnimations: Bool = false) {
        self.animation = animation
        self.disableAnimations = disableAnimations
    }
}

