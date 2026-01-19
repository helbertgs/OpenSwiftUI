import Foundation
import OpenGLFW
import OpenSpatial

/// An object that manages an app’s main event loop and resources used by all of that app’s objects.
@MainActor class Application {

    var globalEnvironmentValues = EnvironmentValues()

    // MARK: - Getting the shared app object

    /// Accessing the shared application
    static let shared = Application()

    var appGraph: GraphHost? = nil

    // MARK: - Managing the event loop

    /// A Boolean value indicating whether the main event loop is running.
    var isRunning: Bool = false

    /// Starts the main event loop.
    func run<T: App>(_ app: T) {
        print("\(Self.self).\(#function)")

        guard glfwInit() == GLFW_TRUE else {
            fatalError("Failed to initialize GLFW")
        }

        glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_API)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3)
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        glfwWindowHint(GLFW_VISIBLE, GLFW_FALSE)
        
        // Build the runtime graph (pure outputs -> runtime objects).
        // self.appGraph = AppGraph(app, environmentValues: globalEnvironmentValues)

        let window = NSWindow(frame: .init(origin: Point3D.zero, size: Size3D(width: 900, height: 450)))
        window.title = "OpenSwiftUI Application"
        window.makeKeyAndOrderFront(self)

        mainLoop: while true {
            // Process all messages in thread's message queue; for GUI applications UI
            // events must have high priority.

            if !isRunning {
                break mainLoop
            }

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
    func terminate(_ sender: Any?) {
        isRunning = false
    }
}
