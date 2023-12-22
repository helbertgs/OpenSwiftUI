#if canImport(AppKit) || os(macOS)
import AppKit

public class NSHostingController<Content> : NSViewController {
    
    // MARK: - Public Property(ies).
    
    public var rootView: Content
    
    // MARK: - Public Constructor(s).
    
    public init(rootView: Content) {
        self.rootView = rootView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Public Function(s).
    
    public override func viewWillAppear() {
        super.viewWillAppear()
        print(#function)
    }
    
    public override func viewDidAppear() {
        super.viewDidAppear()
        print(#function)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    
    public override func viewWillDisappear() {
        super.viewWillDisappear()
        print(#function)
    }
    
    public override func viewDidDisappear() {
        super.viewDidDisappear()
        print(#function)
    }
    
    public override func viewWillLayout() {
        super.viewWillLayout()
        print(#function)
    }
    
    public override func viewDidLayout() {
        super.viewDidLayout()
        print(#function)
    }
}

#endif
