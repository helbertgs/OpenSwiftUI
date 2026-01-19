//
// _Window.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 7, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation
import OpenCombine
import OpenSpatial
import OpenGLFW

package protocol WindowDelegate : AnyObject {

    // MARK: - Minimizing Windows

    /// Tells the delegate that the window is about to be minimized.
    func windowWillMiniaturize(_ window: _Window)

    /// Tells the delegate that the window has been minimized.
    func windowDidMiniaturize(_ window: _Window)

    /// Tells the delegate that the window has been deminimized.
    func windowDidDeminiaturize(_ window: _Window)

    /// Tells the delegate that the window has been resized.
    func windowDidResize(_ window: _Window, to size: Size3D)

    /// Tells the delegate that the window has been loaded.
    func windowLoaded(_ window: _Window)
}

/// A controller for a window.
@MainActor @preconcurrency 
package class _Window {

    // MARK: - GLFW lifecycle

    @MainActor private static var isGLFWInitialized: Bool = false

    @MainActor package static func ensureGLFWInitialized() {
        guard !isGLFWInitialized else { return }
        guard glfwInit() == GLFW_TRUE else {
            fatalError("Failed to initialize GLFW")
        }
        isGLFWInitialized = true
    }

    // MARK: - Checking characteristics 

    /// The identifier of the window.
    package let id: String = UUID().uuidString

    /// The frame of the window.
    package var frame: Rect3D

    /// The size of the window.
    package var size: PassthroughSubject<Size3D, Never> = PassthroughSubject<Size3D, Never>()

    /// The title of the window.
    package var title: String = ""

    // MARK: - Representing a window

    /// The represented object of the window.
    package var representedObject: OpaquePointer?

    /// The delegate of the window.
    package weak var delegate: WindowDelegate?

    // MARK: - Creating a window controller

    /// Creates a window controller with a frame and a title.
    ///
    /// - Parameter frame: The frame of the window.
    /// - Parameter title: The title of the window.
    package init(frame: Rect3D, title: String) {
        self.frame = frame
        self.title = title
    }

    /// Loads the window controller.
    package func loadIfNeeded() {
        _Window.ensureGLFWInitialized()
        guard representedObject == nil else { return }

        glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_API)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1)
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        glfwWindowHint(GLFW_VISIBLE, GLFW_FALSE)

        guard let representedObject = glfwCreateWindow(Int32(frame.size.width), Int32(frame.size.height), title, nil, nil) else {
            fatalError("Failed to create window")
        }

        glfwMakeContextCurrent(representedObject)
        glfwSwapInterval(1)

        self.representedObject = representedObject

        setupUserPointer()
        setupFramebufferSizeCallback()
        setWindowIconifyCallback()
        // setWindowResizeCallback()
        delegate?.windowLoaded(self)
    }

    // MARK: - Closing a window

    /// A Boolean value that indicates whether the window should close.
    package var isShouldClose: Bool {
        get  { return glfwWindowShouldClose(representedObject) == GLFW_TRUE }
        set { glfwSetWindowShouldClose(representedObject, newValue ? GLFW_TRUE : GLFW_FALSE) }
    }

    /// Simulates the user clicking the close button by momentarily highlighting the button and then closing the window.
    nonisolated package func close() {
        isShouldClose = true
    }

    /// Destroys the window controller.
    nonisolated package func destroy() {
        glfwDestroyWindow(representedObject)
        representedObject = nil
    }

    /// Hides the window.
    nonisolated package func hide() {
        glfwHideWindow(representedObject)
    }

    /// Shows the window.
    nonisolated package func show() {
        glfwShowWindow(representedObject)
        delegate?.windowDidDeminiaturize(self)
    }

    nonisolated package func run() {
        loadIfNeeded()
        show()

        while !isShouldClose {
            pollEvents()
            swapBuffers()
        }
    }

    /// Polls for events.
    /// 
    /// This function fetches all events that have been generated since the last call to this function.
    nonisolated package func pollEvents() {
        glfwPollEvents()
    }

    /// Sets the swap interval for the window.
    /// 
    /// The swap interval is the number of frames that are displayed before a buffer swap occurs.
    nonisolated private func swapInterval(_ interval: Int) {
        glfwSwapInterval(Int32(interval))
    }

    /// Waits for events.
    /// 
    /// This function waits until an event is available to be fetched.
    nonisolated private func waitEvents() {
        glfwWaitEvents()
    }

    // MARK: - Rendering hooks

    nonisolated package func makeContextCurrent() {
        guard let representedObject else { return }
        glfwMakeContextCurrent(representedObject)
    }

    nonisolated package func swapBuffers() {
        guard let representedObject else { return }
        glfwSwapBuffers(representedObject)
    }

    /// Sets the pointer of the window.
    nonisolated private func setupUserPointer() {
        guard let representedObject else { return }
        glfwSetWindowUserPointer(representedObject, Unmanaged.passUnretained(self).toOpaque())
    }

    nonisolated private func setupFramebufferSizeCallback() {
        guard let representedObject else { return }
        glfwSetFramebufferSizeCallback(representedObject) { pointer, width, height in
            // glad_glViewport(0, 0, width, height)
            // let window = Unmanaged<_Window>.fromOpaque(glfwGetWindowUserPointer(pointer)).takeUnretainedValue()
            /// window.size.send(Size3D(width: Double(width), height: Double(height), depth: 0))
        }
    }
       

    /// Sets the resize callback of the window.
    nonisolated private func setWindowResizeCallback() {
        guard let representedObject else { return }
        glfwSetWindowSizeCallback(representedObject) { pointer, width, height in
            let window: _Window = Unmanaged<_Window>.fromOpaque(glfwGetWindowUserPointer(pointer)).takeUnretainedValue()
            window.delegate?.windowDidResize(window, to: Size3D(width: Double(width), height: Double(height), depth: 0))
        }
    }

    nonisolated package func setWindowIconifyCallback() {
        guard let representedObject else { return }
        glfwSetWindowIconifyCallback(representedObject) { pointer, iconified in
            let window: _Window = Unmanaged<_Window>.fromOpaque(glfwGetWindowUserPointer(pointer)).takeUnretainedValue()
            if iconified == GLFW_TRUE {
                window.delegate?.windowWillMiniaturize(window)
                window.delegate?.windowDidMiniaturize(window)
            } else {
                window.delegate?.windowDidDeminiaturize(window)
            }
        }
    }

    /// Returns a Boolean value indicating whether two window controllers are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A window controller to compare.
    ///   - rhs: Another window controller to compare.
    package static func == (lhs: _Window, rhs: _Window) -> Bool {
        lhs.id == rhs.id
    }
}

extension EnvironmentValues {

    /// The window controller for the current window.
    @MainActor @preconcurrency package var windowController: [String : _Window] {
        get { self[WindowKey.self] }
        set { self[WindowKey.self] = newValue }
    }
}

/// A key for accessing the window controller for the current window.
///
/// The value of this key is the window controller for the current window.
@MainActor @preconcurrency 
package struct WindowKey : @MainActor EnvironmentKey {

    /// The default value of the key.
    ///
    /// The default value is `nil`.
    @MainActor @preconcurrency package static var defaultValue: [String : _Window] = [:]

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    package static func _valuesEqual(_ lhs: [String : _Window], _ rhs: [String : _Window]) -> Bool {
        lhs.keys.allSatisfy { rhs.keys.contains($0) }
    }
}