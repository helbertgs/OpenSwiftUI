import Foundation
import PythonKit

public class WindowController {

    // MARK: - Property(ies).

    // The main content view controller for the window.
    public var contentViewController: ViewController?

    // The object whose value is presented in the receiver’s primary view.
    var representedObject: PythonObject?

    // A Boolean value that indicates whether the nib file containing the receiver’s window has been loaded.
    public var isWindowLoaded: Bool = false

    // MARK: - Constructor(s). 

    // Creates a titled window that contains the specified content view controller.
    public init(contentViewController: ViewController) {
        self.contentViewController = contentViewController
    }

    // MARK: - Function(s).

    // Loads the receiver’s window from the nib file.
    public func loadWindow() {
        print(#function)

        self.representedObject = Python.import("tkinter").Tk()
        self.representedObject?.title("OpenSwiftUI")
        self.representedObject?.geometry("\(1280)x\(768)")

        self.isWindowLoaded = true
    }

    // Sent before the window owned by the receiver is loaded.
    public func windowWillLoad() {
        print(#function)
    }

    // Sent after the window owned by the receiver has been loaded.
    public func windowDidLoad() {
        print(#function)
    }

    // Passes a display message down the window’s view hierarchy, thus redrawing all views within the window.
    public func display() {
        print(#function)
        self.contentViewController?.display() 
    }

    // Moves the window to the front of the screen list, within its level, and makes it the key window; that is, it shows the window.
    public func makeKeyAndOrderFront(_ sender: Any?) {
        print(#function)
        self.windowWillLoad()
        self.loadWindow()
        self.windowDidLoad()
        self.contentViewController?.loadView()
        self.contentViewController?.view.viewWillMove(toWindow: self)
        self.contentViewController?.viewDidLoad()
        self.contentViewController?.viewWillAppear()
        self.display()
        self.contentViewController?.viewDidAppear()
        self.representedObject?.mainloop()
    }
}