import AppKit

public class NSHostingController<Content> : NSViewController where Content: View {

    public var rootView: Content

    public init(rootView: Content) {
        self.rootView = rootView
        super.init(nibName: nil, bundle: nil)
        self.view = _NSHostingView(rootView: rootView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
