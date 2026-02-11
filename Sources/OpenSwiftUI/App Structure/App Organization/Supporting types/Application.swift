//
// App.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 6, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation
import OpenGLFW
import OpenSpatial

/// An object that manages an app's main event loop and resources used by all of that app's objects.
@MainActor class Application {

    // MARK: - Getting the shared app object

    /// Accessing the shared application
    @MainActor static let shared = Application()

    // MARK: - Properties

    /// Global environment values shared across the application.
    var globalEnvironmentValues = EnvironmentValues()

    /// The root graph of the application.
    var appGraph: GraphHost? = nil

    /// A Boolean value indicating whether the main event loop is running.
    private(set) var isRunning: Bool = false

    /// A Boolean value indicating whether GLFW has been initialized.
    private var isGLFWInitialized: Bool = false

    /// An array of the app's window objects.
    var windows: [NSWindow] = []

    /// A Boolean value indicating whether the app is hidden.
    var isHidden: Bool = false

    // MARK: - Initialization

    private init() {}

    // MARK: - Running the Application

    /// Starts the main event loop.
    func run<T: App>(_ app: T) {
        defer { cleanup() }
        
        guard initialize() else { return }
        
        setupEnvironment()
        buildAppGraph(app)
        runMainLoop()
    }

    /// Initializes GLFW and configures window hints.
    private func initialize() -> Bool {
        guard glfwInit() == GLFW_TRUE else {
            print("Failed to initialize GLFW")
            return false
        }
        
        isGLFWInitialized = true
        configureGLFWHints()
        return true
    }

    /// Configures GLFW window hints for OpenGL context.
    private func configureGLFWHints() {
        glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_API)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3)
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        glfwWindowHint(GLFW_VISIBLE, GLFW_FALSE)
    }

    /// Sets up the global environment values.
    private func setupEnvironment() {
        globalEnvironmentValues.openWindow = .init({ [weak self] id in 
            self?.openWindow(id) 
        })
    }

    /// Builds the application graph from the app instance.
    private func buildAppGraph<T: App>(_ app: T) {
        appGraph = AppGraph(app, environmentValues: globalEnvironmentValues)
    }

    /// Runs the main event loop.
    private func runMainLoop() {
        while true {
            updateWindows()
            
            guard isRunning else { break }

            appGraph?.processEvents()
            appGraph?.clear()
            appGraph?.render()

            appGraph?.swapBuffers()
            appGraph?.pollEvents()

            processRunLoop()
        }
    }

    /// Processes the Foundation RunLoop.
    private func processRunLoop() {
        var time: Date?
        repeat {
            // Execute Foundation.RunLoop once and determine the next time the timer
            // fires. At this point handle all Foundation.RunLoop timers, sources and
            // Dispatch.DispatchQueue.main tasks
            time = RunLoop.main.limitDate(forMode: .default)
            
            // If Foundation.RunLoop doesn't contain any timers or the timers should
            // not be running right now, we interrupt the current loop or otherwise
            // continue to the next iteration.
        } while (time?.timeIntervalSinceNow ?? -1) <= 0
    }

    /// Cleans up resources when the application terminates.
    private func cleanup() {
        // 1. First, destroy all GLFW windows while GLFW is still active
        // This must happen BEFORE glfwTerminate()
        for window in windows {
            window.destroy()
        }
        
        // 2. Clear the windows array
        windows.removeAll()
        
        // 3. Unmount the app graph (SceneGraphs, ViewGraphs, etc.)
        // Window references are already destroyed, so no GLFW calls will happen
        appGraph?.unmount()
        appGraph = nil
        
        // 4. Terminate GLFW (only once, at the very end)
        if isGLFWInitialized {
            glfwTerminate()
            isGLFWInitialized = false
        }
    }

    // MARK: - Terminating the app

    /// Terminates the receiver.
    func terminate(_ sender: Any? = nil) {
        isRunning = false
    }

    // MARK: - Starting the app

    /// Marks the application as running. Called when the first window is shown.
    func start() {
        isRunning = true
    }

    // MARK: - Managing App Windows

    /// Finds a window by its identifier.
    func window(withId id: String) -> NSWindow? {
        windows.first { $0.id == id }
    }

    /// Registers a window with the application.
    func registerWindow(_ window: NSWindow) {
        guard !windows.contains(where: { $0 === window }) else { return }
        windows.append(window)
    }

    /// Unregisters a window from the application.
    func unregisterWindow(_ window: NSWindow) {
        windows.removeAll { $0 === window }
    }

    // MARK: - Minimizing Windows

    /// Miniaturizes all the receiver's windows.
    func miniaturizeAll(_ sender: Any?) {
        windows.forEach { $0.miniaturize(sender) }
    }

    // MARK: - Hiding Windows

    /// Hides all the receiver's windows, and the next app in line is activated.
    func hide(_ sender: Any?) {
        isHidden = true
        windows.forEach { $0.orderOut(sender) }
    }

    /// Restores hidden windows to the screen and makes the receiver active.
    func unhide(_ sender: Any?) {
        isHidden = false
        windows.forEach { $0.orderFront(sender) }
    }

    // MARK: - Updating Windows
    
    /// Sends an update() message to each onscreen window.
    func updateWindows() {
        windows.forEach { $0.update() }
    }

    /// Opens a window with the specified identifier.
    @MainActor func openWindow(_ id: String) {
        guard let window = window(withId: id) else { return }
        window.makeKeyAndOrderFront(nil)
    }
}
