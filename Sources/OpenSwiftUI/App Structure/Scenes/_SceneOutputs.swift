import Swift

@dynamicMemberLookup
@frozen public struct _SceneOutputs {

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

extension _SceneOutputs {
    static func + (_ lhs: _SceneOutputs, _ rhs: _SceneOutputs) -> _SceneOutputs {
        var output = _SceneOutputs()
        lhs.props.forEach { (key: String, value: Any) in
            output.props[key] = value
        }
        
        rhs.props.forEach { (key: String, value: Any) in
            output.props[key] = value
        }
        
        return output
    }
}
