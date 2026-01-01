import AppKit

public class _NSHostingView<Content> : NSView where Content : View {

    public let rootView : Content

    public init(rootView: Content) {
        self.rootView = rootView
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
