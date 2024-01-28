import Foundation
import PythonKit

public class ViewController {
    
    // MARK: - Property(ies).

    // The view controller’s primary view.
    public var view: _View!

    // The localized title of the receiver’s primary view.
    public var title: String?

    // A Boolean value indicating whether the view controller’s view is loaded into memory.
    public private(set) var isViewLoaded: Bool = false

    // MARK: - Constructor(s). 

    // Creates a hosting controller object that wraps the specified OpenSwiftUI view.
    public init() { }

    // MARK: - Function(s).

    public func loadView() {
        print(#function)
        self.isViewLoaded = true
    }

    // Called after the view controller’s view has been loaded into memory.
    public func viewDidLoad() {
        print(#function)
    }

    // Called after the view controller’s view has been loaded into memory is about to be added to the view hierarchy in the window.
    public func viewWillAppear() {
        print(#function)
    }

    // Called when the view controller’s view is fully transitioned onto the screen.
    public func viewDidAppear() {
        print(#function)
    }

    public func display() {
        print(#function)
        self.view.display()
    }
}

public class HostingController<Content> : ViewController where Content : View {
    
    // MARK: - Property(ies).

    // The root view of the OpenSwiftUI view hierarchy managed by this view controller.
    public let rootView: Content

    // MARK: - Constructor(s). 

    // Creates a hosting controller object that wraps the specified OpenSwiftUI view.
    public init(rootView: Content) {
        self.rootView = rootView
        super.init()
    }

    // MARK: - Function(s).

    public override func loadView() { 
        super.loadView()
        self.view = HostingView(rootView: rootView)
    }

    // Called after the view controller’s view has been loaded into memory.
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Called after the view controller’s view has been loaded into memory is about to be added to the view hierarchy in the window.
    public override func viewWillAppear() {
        super.viewWillAppear()
    }

    // Called when the view controller’s view is fully transitioned onto the screen.
    public override func viewDidAppear() {
        super.viewDidAppear()
    }

    public override func display() {
        super.display()
    }
}