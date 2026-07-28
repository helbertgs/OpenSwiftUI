import Foundation

public struct ViewThatFits<Content> where Content : View {
    
    var _tree: _VariadicView.Tree<_SizeFittingRoot, Content>
  
    public init(in axes: Axis.Set = [.horizontal, .vertical], @ViewBuilder content: () -> Content) {
        _tree = .init(_SizeFittingRoot(axes: axes)) { content() }
    }
}

extension ViewThatFits : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    /// Builds the view outputs for this view within the attribute graph.
    ///
    /// - Parameters:
    ///   - view: The graph value wrapping this view instance.
    ///   - inputs: The view inputs propagated from the parent context.
    /// - Returns: The `_ViewOutputs` produced for this view.
    public static func _makeView(view: _GraphValue<ViewThatFits<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("not implemented yet")
    }
}