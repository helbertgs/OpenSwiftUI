#if os(Windows) && canImport(SwiftWin32)
import SwiftWin32

public class HostingController<Content> : ViewController {
    
    // MARK: - Public Property(ies).
    
    public var rootView: Content
    
    // MARK: - Public Constructor(s).
    
    public init(rootView: Content) {
        self.rootView = rootView
        super.init()
    }
    
    // MARK: - Public Function(s).
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
}

#endif
