import Foundation

/// An object that manages an app’s main event loop and resources used by all of that app’s objects.
@MainActor public class Application {

    private var environmentValues = EnvironmentValues()

    // MARK: - Getting the shared app object

    /// Accessing the shared application
    public static let shared = Application()

    // MARK: - Managing the event loop

    /// A Boolean value indicating whether the main event loop is running.
    public var isRunning: Bool = false

    /// Starts the main event loop.
    public func run<T: App>(_ app: T) {
        print("\(Self.self).\(#function)")

        var inputs = _SceneInputs()
        inputs.environmentValues = environmentValues

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
    public func terminate(_ sender: Any?) {
        isRunning = false
    }
}
