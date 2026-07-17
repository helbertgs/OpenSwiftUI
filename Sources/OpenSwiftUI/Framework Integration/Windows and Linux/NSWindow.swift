//
// NSWindow.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 18, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

@preconcurrency 
import OpenGLAD
import OpenGLFW
import OpenSpatial
import Foundation

@MainActor class NSWindow : NSResponder {

    var id: String = UUID().uuidString
    private let pointer: OpaquePointer

    // MARK: - Managing the Window’s Behavior

    // The window’s delegate.
    weak var delegate: NSWindowDelegate?

    /// A Boolean value indicating whether the GLFW window has been destroyed.
    private var isDestroyed: Bool = false

    var environmentValues: EnvironmentValues?

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
    }

    // MARK: - Configuring the Window’s Content

    var contentView: NSView?

    // MARK: - Sizing Windows

    /// The window’s frame rectangle in screen coordinates, including the title bar.
    var frame: Rect3D {
        willSet {
            contentView?.frame = newValue
        }
    }

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

    /// A Boolean value that indicates whether the window is visible onscreen (even when it's obscured by other windows).
    var isVisible: Bool {
        guard !isDestroyed else { return false }
        return glfwGetWindowAttrib(pointer, GLFW_VISIBLE) == GLFW_TRUE
    }

    // MARK: - Managing Key Status

    /// A Boolean value that indicates whether the window is the key window for the application.
    var isKeyWindow: Bool = false {
        didSet { 
            if isKeyWindow && !oldValue {
                becomeKey()
            } else if !isKeyWindow && oldValue {
                resignKey()
            }
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
        Application.shared.start()
    }

    /// Informs the window that it has become the key window.
    func becomeKey() {

    }

    /// Resigns the window’s key window status.
    func resignKey() {

    }

    // MARK: - Managing Main Status
    
    /// A Boolean value that indicates whether the window is the application's main window.
    private(set) var isMainWindow: Bool = false {
        didSet {
            if isMainWindow && !oldValue {
                becomeMain()
            } else if !isMainWindow && oldValue {
                resignMain()
            }
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
    func becomeMain() { }
    
    /// Resigns the window’s main window status.
    func resignMain() { }

    // MARK: - Drawing Windows

    /// Passes a display message down the window’s view hierarchy, thus redrawing all views within the window.
    func display() {
        contentView?.display()
    }

    /// Passes a display message down the window’s view hierarchy, thus redrawing all views that need displaying.
    func displayIfNeeded() {
        if viewsNeedDisplay {
            display()
        }
    }

    /// A Boolean value that indicates whether any of the window’s views need to be displayed.
    var viewsNeedDisplay: Bool = true

    /// A Boolean value that indicates whether the window allows multithreaded view drawing.
    var allowsConcurrentViewDrawing: Bool = false

    // MARK: - Updating Windows

    /// Updates the window.
    func update() {
        // Don't process updates for destroyed windows
        guard !isDestroyed else { return }
        
        if isShouldClose {
            destroy()
            Application.shared.unregisterWindow(self)

            if Application.shared.windows.isEmpty {
                Application.shared.terminate()
            }
        }
    }

    // MARK: - Closing Windows

    /// A Boolean value that indicates whether the window is released when it receives the close message.
    var isReleasedWhenClosed: Bool = false

    /// A Boolean value that indicates whether the window should close.
    var isShouldClose: Bool {
        guard !isDestroyed else { return true }
        return glfwWindowShouldClose(pointer) == GLFW_TRUE
    }

    /// Simulates the user clicking the close button by momentarily highlighting the button and then closing the window.
    func performClose(_ sender: Any?) {
        close()
    }
    
    /// Removes the window from the screen.
    func close() {
        guard !isDestroyed else { return }
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
        guard !isDestroyed else { return }
        glfwIconifyWindow(pointer)
    }

    /// De-minimizes the window.
    func deminiaturize(_ sender: Any?) {
        guard !isDestroyed else { return }
        glfwRestoreWindow(pointer)
    }

    // MARK: - Managing Titles
    
    /// The string that appears in the title bar of the window or the path to the represented file.
    var title: String { 
        get { 
            guard !isDestroyed else { return "" }
            if let cString = glfwGetWindowTitle(pointer) {
                return String(cString: cString)
            }
            return ""
        } set {
            guard !isDestroyed else { return }
            glfwSetWindowTitle(pointer, newValue)
        }
    }

    // MARK: - Accessing Screen Information

    /// The screen the window is on.
    var screen: NSScreen? {
        guard !isDestroyed else { return nil }
        guard let monitor = glfwGetWindowMonitor(pointer) else {
            return nil
        }

        return NSScreen(monitor)
    }

    // MARK: - GLFW Function(s)

    private func makeContextCurrent() {
        guard !isDestroyed else { return }
        glfwMakeContextCurrent(pointer)

        guard gladLoaderLoadGL() != GL_FALSE else {
            fatalError("GLAD: Fail to initialize")
        }
    }

    /// Destroys the GLFW window. Safe to call multiple times.
    func destroy() {
        guard !isDestroyed else { return }
        isDestroyed = true
        glfwDestroyWindow(pointer)
    }

    private func hide() {
        guard !isDestroyed else { return }
        glfwHideWindow(pointer)
    }

    private func show() {
        guard !isDestroyed else { return }
        glfwShowWindow(pointer)
    }

    func swapBuffers() {
        guard !isDestroyed else { return }
        glfwSwapBuffers(pointer)
    }

    private func swapInterval(_ interval: Int) {
        guard !isDestroyed else { return }
        glfwSwapInterval(Int32(interval))
    }

    func pollEvents() {
        // pollEvents is global, doesn't need destroyed check
        glfwPollEvents()
    }

    private func waitEvents() {
        // waitEvents is global, doesn't need destroyed check
        glfwWaitEvents()
    }

    func clear() {
        glad_glClearColor(0.2, 0.3, 0.3, 1.0)
        glad_glClear(UInt32(GL_COLOR_BUFFER_BIT))
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
        
        // Notifica que a janela foi carregada
        delegate?.windowLoaded(self)
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
            let newSize = Size3D(width: Double(width), height: Double(height))
            window.frame = Rect3D(origin: window.frame.origin, size: newSize)
            window.delegate?.windowDidResize(window, to: newSize)
        }
    }

    /// Sets the framebuffer size callback of the window.
    private func setFramebufferSizeCallback() {
        glfwSetFramebufferSizeCallback(pointer) { pointer, width, height in
            glad_glViewport(0, 0, width, height)
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
            let wasMiniaturized = window.isMiniaturized
            let isNowMiniaturized = iconified == GLFW_TRUE
            
            if isNowMiniaturized && !wasMiniaturized {
                window.delegate?.windowWillMiniaturize(window)
                window.isMiniaturized = true
                window.delegate?.windowDidMiniaturize(window)
            } else if !isNowMiniaturized && wasMiniaturized {
                window.isMiniaturized = false
                window.delegate?.windowDidDeminiaturize(window)
            }
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
