@preconcurrency 
import OpenGLAD
import OpenGLFW
import OpenSpatial
import Foundation

@MainActor class NSWindow : NSResponder {

    var id: String = UUID().uuidString
    private let pointer: OpaquePointer

    weak var delegate: NSWindowDelegate?

    init(frame: Rect3D) {
        self.frame = frame
        guard let pointer = glfwCreateWindow(Int32(frame.size.width), Int32(frame.size.height), "NSWindow", nil, nil) else {
            fatalError()
        }
        
        self.pointer = pointer
        super.init()
        self.setupCallbacks()
    }

    @MainActor deinit {
        destroy()
        terminate()
    }

    // MARK: - Sizing Windows

    /// The window’s frame rectangle in screen coordinates, including the title bar.
    var frame: Rect3D

    // MARK: - Managing Window Visibility and Occlusion State

    /// Removes the window from the screen list, which hides the window.
    func orderOut(_ sender: Any?) {
        hide()
    }

    /// Moves the window to the back of its level in the screen list, without changing either the key window or the main window.
    func orderBack(_ sender: Any?) {
    }

    /// Moves the window to the front of its level in the screen list, without changing either the key window or the main window.
    func orderFront(_ sender: Any?) {
        show()
    }
    
    // MARK: - Managing Window Layers

    /// A Boolean value that indicates whether the window is visible onscreen (even when it’s obscured by other windows).
    var isVisible: Bool {
        glfwGetWindowAttrib(pointer, GLFW_VISIBLE) == GLFW_TRUE
    }

    // MARK: - Managing Key Status

    /// A Boolean value that indicates whether the window is the key window for the application.
    var isKeyWindow: Bool = false {
        didSet { 
            oldValue == true ? becomeKey() : resignKey()
        }
    }

    /// A Boolean value that indicates whether the window can become the key window.
    var canBecomeKey: Bool = true

    /// Makes the window the key window.
    func makeKey() {

        guard canBecomeKey else { return }
        isKeyWindow = true
        makeContextCurrent()
    }

    /// Moves the window to the front of the screen list, within its level, and makes it the key window; that is, it shows the window.
    func makeKeyAndOrderFront(_ sender: Any?) {
        makeKey()
        orderFront(sender)
        Application.shared.isRunning = true
    }

    /// Informs the window that it has become the key window.
    func becomeKey() {

    }

    /// Resigns the window’s key window status.
    func resignKey() {

    }

    // MARK: - Managing Main Status
    
    /// A Boolean value that indicates whether the window is the application’s main window.
    private(set) var isMainWindow: Bool = false {
        didSet {
            oldValue == true ? becomeMain() : resignMain()
        }
    }
    
    /// A Boolean value that indicates whether the window can become the application’s main window.
    private(set) var canBecomeMain: Bool = true
    
    /// Makes the window the main window.
    func makeMain() {
        guard canBecomeMain else { return }
        isMainWindow = true
    }
    
    /// Informs the window that it has become the main window.
    func becomeMain() {

    }
    
    /// Resigns the window’s main window status.
    func resignMain() {

    }

    // MARK: - Drawing Windows

    /// Passes a display message down the window’s view hierarchy, thus redrawing all views within the window.
    func display() {

    }

    /// Passes a display message down the window’s view hierarchy, thus redrawing all views that need displaying.
    func displayIfNeeded() {
    }

    /// A Boolean value that indicates whether any of the window’s views need to be displayed.
    var viewsNeedDisplay: Bool = false

    /// A Boolean value that indicates whether the window allows multithreaded view drawing.
    var allowsConcurrentViewDrawing: Bool = false

    // MARK: - Updating Windows

    /// Updates the window.
    func update() {
        if isShouldClose {
            close()
            terminate()
            Application.shared.windows.removeAll { $0 === self }

            if Application.shared.windows.count == 0 {
                Application.shared.terminate()
            }
        }
    }

    // MARK: - Closing Windows

    /// A Boolean value that indicates whether the window is released when it receives the close message.
    var isReleasedWhenClosed: Bool = false

    /// A Boolean value that indicates whether the window should close.
    var isShouldClose: Bool {
        glfwWindowShouldClose(pointer) == GLFW_TRUE
    }

    /// Simulates the user clicking the close button by momentarily highlighting the button and then closing the window.
    func performClose(_ sender: Any?) {
        close()
    }
    
    /// Removes the window from the screen.
    func close() {
        glfwSetWindowShouldClose(pointer, GLFW_TRUE)
    }

    // MARK: - Minimizing Windows

    /// A Boolean value that indicates whether the window is minimized.
    private(set) var isMiniaturized: Bool = false

    /// Simulates the user clicking the minimize button by momentarily highlighting the button, then minimizing the window.
    func performMiniaturize(_ sender: Any?) {
        miniaturize(sender)
    }

    /// Removes the window from the screen list and displays the minimized window in the Dock.
    func miniaturize(_ sender: Any?) {
        glfwIconifyWindow(pointer)
    }

    /// De-minimizes the window.
    func deminiaturize(_ sender: Any?) {
        glfwRestoreWindow(pointer)
    }

    // MARK: - Managing Titles
    
    /// The string that appears in the title bar of the window or the path to the represented file.
    var title: String { 
        get { 
            if let cString = glfwGetWindowTitle(pointer) {
                return String(cString: cString)
            }
            return ""
        } set {
            glfwSetWindowTitle(pointer, newValue)
        }
    }

    // MARK: - Accessing Screen Information

    /// The screen the window is on.
    var screen: NSScreen? {
        guard let monitor = glfwGetWindowMonitor(pointer) else {
            return nil
        }

        return NSScreen(monitor)
    }

    // MARK: - GLFW Function(s)

    private func makeContextCurrent() {
        glfwMakeContextCurrent(pointer)
    }

    private func destroy() {
        glfwDestroyWindow(pointer)
    }

    private func terminate() {
        glfwTerminate()
    }

    private func hide() {
        glfwHideWindow(pointer)
    }

    private func show() {
        glfwShowWindow(pointer)
    }

    func swapBuffers() {
        glfwSwapBuffers(pointer)
    }

    private func swapInterval(_ interval: Int) {
        glfwSwapInterval(Int32(interval))
    }

    func pollEvents() {
        glfwPollEvents()
    }

    private func waitEvents() {
        glfwWaitEvents()
    }

    // MARK: - GLFW Callbacks

    /// Sets up the callbacks for the window.
    private func setupCallbacks() {
        makeContextCurrent()
        setupUserPointer()
        setWindowCloseCallback()
        setWindowSizeCallback()
        setFramebufferSizeCallback()
        setWindowPosCallback()
        setWindowIconifyCallback()
        setWindowMaximizeCallback()
        setWindowFocusCallback()
        setWindowRefreshCallback()
    }

    /// Sets up the user pointer for the window.
    private func setupUserPointer() {
        glfwSetWindowUserPointer(pointer, Unmanaged.passUnretained(self).toOpaque())
    }

    /// Sets the close callback of the window.
    private func setWindowCloseCallback() {
        glfwSetWindowCloseCallback(pointer) { pointer in
            let _ = Unmanaged<NSWindow>.fromOpaque(glfwGetWindowUserPointer(pointer)).takeUnretainedValue()
        }
    }

    /// Sets the size callback of the window.
    private func setWindowSizeCallback() {
        glfwSetWindowSizeCallback(pointer) { pointer, width, height in
            let window = Unmanaged<NSWindow>.fromOpaque(glfwGetWindowUserPointer(pointer)).takeUnretainedValue()
            window.frame = Rect3D(origin: window.frame.origin, size: Size3D(width: Double(width), height: Double(height)))
        }
    }

    /// Sets the framebuffer size callback of the window.
    private func setFramebufferSizeCallback() {
        glfwSetFramebufferSizeCallback(pointer) { pointer, width, height in
            // glad_glViewport(0, 0, width, height)
        }
    }

    /// Sets the position callback of the window.
    private func setWindowPosCallback() {
        glfwSetWindowPosCallback(pointer) { pointer, x, y in
            let window = Unmanaged<NSWindow>.fromOpaque(glfwGetWindowUserPointer(pointer)).takeUnretainedValue()
            window.frame = Rect3D(origin: Point3D(x: Double(x), y: Double(y)), size: window.frame.size)
        }
    }

    /// Sets the iconify callback of the window.
    private func setWindowIconifyCallback() {
        glfwSetWindowIconifyCallback(pointer) { pointer, iconified in
            let window = Unmanaged<NSWindow>.fromOpaque(glfwGetWindowUserPointer(pointer)).takeUnretainedValue()
            window.isMiniaturized = iconified == GLFW_TRUE
        }
    }

    /// Sets the maximize callback of the window.
    private func setWindowMaximizeCallback() {
        glfwSetWindowMaximizeCallback(pointer) { pointer, maximized in
            let _ = Unmanaged<NSWindow>.fromOpaque(glfwGetWindowUserPointer(pointer)).takeUnretainedValue()
        }
    }

    /// Sets the focus callback of the window.
    private func setWindowFocusCallback() {
        glfwSetWindowFocusCallback(pointer) { pointer, focused in
            let _ = Unmanaged<NSWindow>.fromOpaque(glfwGetWindowUserPointer(pointer)).takeUnretainedValue()
        }
    }

    private func setWindowRefreshCallback() {
        glfwSetWindowRefreshCallback(pointer) { pointer in
        }
    }
}

protocol NSWindowDelegate : AnyObject {

    // MARK: - Minimizing Windows

    /// Tells the delegate that the window is about to be minimized.
    func windowWillMiniaturize(_ window: NSWindow)

    /// Tells the delegate that the window has been minimized.
    func windowDidMiniaturize(_ window: NSWindow)

    /// Tells the delegate that the window has been deminimized.
    func windowDidDeminiaturize(_ window: NSWindow)

    /// Tells the delegate that the window has been resized.
    func windowDidResize(_ window: NSWindow, to size: Size3D)

    /// Tells the delegate that the window has been loaded.
    func windowLoaded(_ window: NSWindow)
}
