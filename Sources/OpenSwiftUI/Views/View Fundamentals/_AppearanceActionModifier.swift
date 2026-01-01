import Swift

@frozen
public struct _AppearanceActionModifier : ViewModifier {

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
    
    public func body(content: Content) -> some View {
        fatalError()
    }

    public static func _makeView(modifier: _GraphValue<_AppearanceActionModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        .init()
    }

    public static func _makeViewList(modifier: _GraphValue<_AppearanceActionModifier>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError()
    }

    public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError()
    }
}
