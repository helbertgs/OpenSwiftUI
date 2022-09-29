import Swift

/// An empty, or identity, modifier, used during development to switch
/// modifiers at compile time.
///
/// Use the empty modifier to switch modifiers at compile time during
/// development. In the example below, in a debug build the ``Text``
/// view inside `ContentView` has a yellow background and a red border.
/// A non-debug build reflects the default system, or container supplied
/// appearance.
///
///     struct EmphasizedLayout: ViewModifier {
///         func body(content: Content) -> some View {
///             content
///                 .background(Color.yellow)
///                 .border(Color.red)
///         }
///     }
///
///     struct ContentView: View {
///         var body: some View {
///             Text("Hello, World!")
///                 .modifier(modifier)
///         }
///
///         var modifier: some ViewModifier {
///             #if DEBUG
///                 return EmphasizedLayout()
///             #else
///                 return EmptyModifier()
///             #endif
///         }
///     }
///
@frozen public struct EmptyModifier : ViewModifier {

    public static let identity: EmptyModifier = .init()

    /// The type of view representing the body.
    public typealias Body = Never

    @inlinable public init() { }

    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    public func body(content: EmptyModifier.Content) -> EmptyModifier.Body {
        fatalError()
    }

    public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        nil
    }

    public static func _makeView(modifier: _GraphValue<EmptyModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        .init()
    }

    public static func _makeViewList(modifier: _GraphValue<EmptyModifier>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        .init()
    }
}
