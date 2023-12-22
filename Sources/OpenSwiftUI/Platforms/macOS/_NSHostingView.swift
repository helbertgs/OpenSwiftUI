#if canImport(AppKit) || os(macOS)
import AppKit

class NSHostingView<Content> : NSView {
    
    // MARK: - Public Property(ies).
    
    var rootView: Content
    
    // MARK: - Public Constructor(s).
    
    init(rootView: Content) {
        self.rootView = rootView
        super.init(frame: .init(x: 0, y: 0, width: 800, height: 600))
    }
    
    required init?(coder: NSCoder) { nil }
}

#endif
