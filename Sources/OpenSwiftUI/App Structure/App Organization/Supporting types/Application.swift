import Foundation
import OpenGLFW
import OpenSpatial

/// An object that manages an app’s main event loop and resources used by all of that app’s objects.
@MainActor class Application {

    var globalEnvironmentValues = EnvironmentValues()

    // MARK: - Getting the shared app object

    /// Accessing the shared application
    @MainActor static let shared = Application()

    var appGraph: GraphHost? = nil

    // MARK: - Managing the event loop

    /// A Boolean value indicating whether the main event loop is running.
    var isRunning: Bool = false

    /// Starts the main event loop.
    func run<T: App>(_ app: T) {
        guard glfwInit() == GLFW_TRUE else {
            fatalError("Failed to initialize GLFW")
        }

        glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_API)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3)
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        glfwWindowHint(GLFW_VISIBLE, GLFW_FALSE)
        
        globalEnvironmentValues.openWindow = .init({ id in self.openWindow(id) })

        /// Build the runtime graph (pure outputs -> runtime objects).
        self.appGraph = AppGraph(app, environmentValues: globalEnvironmentValues)

        // isRunning = true

        mainLoop: while true {
            updateWindows()

            if !isRunning {
                break mainLoop
            }          

            // Process all messages in thread's message queue; for GUI applications UI
            // events must have high priority.

            appGraph?.processEvents()
            appGraph?.render()
            appGraph?.swapBuffers()

            var time: Date? = nil
            repeat {
                // Execute Foundation.RunLoop once and determine the next time the timer
                // fires.  At this point handle all Foundation.RunLoop timers, sources and
                // Dispatch.DispatchQueue.main tasks
                time = RunLoop.main.limitDate(forMode: .default)
                
                // If Foundation.RunLoop doesn't contain any timers or the timers should
                // not be running right now, we interrupt the current loop or otherwise
                // continue to the next iteration.
            } while (time?.timeIntervalSinceNow ?? -1) <= 0
        }
    }

    // MARK: - Terminating the app

    /// Terminates the receiver.
    func terminate(_ sender: Any? = nil) {
        isRunning = false
    }

    // MARK: - Managing App Windows

    /// An array of the app’s window objects.
    var windows: [NSWindow] = []

    // MARK: - Minimizing Windows

    /// Miniaturizes all the receiver’s windows.
    func miniaturizeAll(_ sender: Any?) {
        windows.forEach { $0.miniaturize(sender) }
    }

    // MARK: - Hiding Windows

    /// A Boolean value indicating whether the app is hidden.
    var isHidden: Bool = false

    /// Hides all the receiver’s windows, and the next app in line is activated.
    func hide(_ sender: Any?) {
        windows.forEach { $0.orderOut(sender) }
    }

    /// Restores hidden windows to the screen and makes the receiver active.
    func unhide(_ sender: Any?) {
        windows.forEach { $0.orderFront(sender) }
    }

    // MARK: - Updating Windows
    
    /// Sends an update() message to each onscreen window.
    func updateWindows() {
        windows.forEach { $0.update() }
    }

    @MainActor func openWindow(_ id: String) {
        guard let window = windows.first(where: { $0.id == id }) else { return }
        window.makeKeyAndOrderFront(nil)
    }
}
