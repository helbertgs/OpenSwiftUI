import Swift

public protocol _UIHostingViewable : AnyObject {
    var rootView: AnyView { get set }
    func _render(seconds: Double)
    func _forEachIdentifiedView(body: (_IdentifiedViewProxy) -> Void)
    func sizeThatFits(in size: Size) -> Size
    var _disableSafeArea: Bool { get set }
    var _rendererConfiguration: _RendererConfiguration { get set }
    var _rendererObject: AnyObject? { get }
}
