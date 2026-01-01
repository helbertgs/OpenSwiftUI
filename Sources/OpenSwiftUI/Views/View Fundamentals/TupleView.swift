import Swift

/// A View created from a swift tuple of View values.
@frozen public struct TupleView<T> : View {

    // MARK: - Type Alias.
    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    public var body: Never { fatalError() }

    // MARK: - Public Property(ies).
    public var value: T

    // MARK: - Constructor(s).
    @inlinable public init(_ value: T) {
        self.value = value
    }

    public static func _makeView(view: _GraphValue<TupleView<T>>, inputs: _ViewInputs) -> _ViewOutputs {
        let mirror = Mirror(reflecting: view.value.value)
        var outputs = _ViewOutputs()
        outputs.type = Self.self
        outputs.content = view.value

        for child in mirror.children {
            guard let childView = child.value as? any View else {
                continue
            }

            func build<V>(_ view: V, inputs: _ViewInputs) -> _ViewOutputs where V : View {
                V._makeView(view: _GraphValue(view), inputs: inputs)
            }

            let output = build(childView, inputs: inputs)
            outputs.children.append(output)
        }

        return outputs
    }
}
