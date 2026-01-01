import Swift

/// The kinds of background tasks that your app or extension can handle.
///
/// Use a value of this type with the ``Scene/backgroundTask(_:action:)`` scene
/// modifier to create a handler for background tasks that the system sends
/// to your app or extension. For example, you can use ``urlSession`` to define
/// an asynchronous closure that the system calls when it launches your app or
/// extension to handle a response from a background
/// <doc://com.apple.documentation/documentation/Foundation/URLSession>.
@MainActor
public struct BackgroundTask<Request, Response> : Sendable {
    
    let request: Request
    let response: Response

    init(request: Request, response: Response) {
        self.request = request
        self.response = response
    }
}

extension BackgroundTask {

    /// A task that responds to background URL sessions.
    public static var urlSession: BackgroundTask<String, Void> {
        fatalError()
    }

    /// A task that responds to background URL sessions matching the given
    /// identifier.
    ///
    /// - Parameter identifier: The identifier to match.
    ///
    /// - Returns: A background task that you can handle with your app or
    ///   extension.
    public static func urlSession(_ identifier: String) -> BackgroundTask<Void, Void> {
        fatalError()
    }

    /// A task that responds to background URL sessions matching the given
    /// predicate.
    ///
    /// - Parameter matching: The predicate to match.
    ///
    /// - Returns: A background task that you can handle with your app or
    ///   extension.
    public static func urlSession(matching: @escaping @Sendable (String) -> Bool) -> BackgroundTask<String, Void> {
        fatalError()
    }
}
