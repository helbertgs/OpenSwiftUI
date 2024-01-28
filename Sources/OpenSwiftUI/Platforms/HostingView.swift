import Foundation
import PythonKit

public class _View {

    // MARK: - Property(ies).

    // The view’s window object, if it is installed in a window.
    public var window: WindowController?

    // The object whose value is presented in the receiver’s primary view.
    public internal(set) var representedObject: PythonObject?

    // The view that is the parent of the current view.
    public var superview: _View?

    // MARK: - Constructor(s). 

    public init() { }
    
    // MARK: - Function(s).

    // Displays the view and all its subviews if possible
    public func display() {
        print(#function)
    }

    // Informs the view that it’s being added to the view hierarchy of the specified window object (which may be nil).
    public func viewWillMove(toWindow window: WindowController?) {
        self.window = window
    }
}

public class HostingView<Content> : _View where Content : View {

    // MARK: - Property(ies).

    // The root view of the SwiftUI view hierarchy managed by this view controller.
    public var rootView: Content

    // MARK: - Constructor(s). 

    public init(rootView: Content) {
        self.rootView = rootView
        super.init()
    }

    // MARK: - Function(s).

    // Displays the view and all its subviews if possible
    public override func display() {
        super.display()
        var inputs = _ViewInputs()
        inputs.window = self.window
        self.representedObject = Content._makeView(view: _GraphValue(rootView), inputs: inputs).representedObject
    }
}