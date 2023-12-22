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

extension _SceneInputs {
    static func + (_ lhs: _SceneOutputs, _ rhs: _SceneInputs) -> _SceneInputs {
        var output = _SceneInputs()
        lhs.props.forEach { (key: String, value: Any) in
            output.props[key] = value
        }
        
        rhs.props.forEach { (key: String, value: Any) in
            output.props[key] = value
        }
        
        return output
    }
}
