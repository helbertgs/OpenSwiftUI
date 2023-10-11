import Swift

@dynamicMemberLookup
@frozen public struct _SceneInputs {

    // MARK: - Property(ies).

    @usableFromInline var props: [String: Any]

    // MARK: - Constructor(s).

    @inlinable internal init(props: [String : Any] = [:]) {
        self.props = props
    }

    // MARK: - Subscript(s).

    @inlinable internal subscript<U>(dynamicMember member: String) -> U {
        get { props[member] as! U }
        set { props[member] = newValue }
    }
}
