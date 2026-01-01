import Foundation
import Swift

public struct OpenDocumentAction {

    /// Opens the document at the specified file URL, if it a type that's
    /// defined by a document group defined in this app.
    ///
    /// The document is be opened in a new window, if not already opened.
    /// Otherwise, the window containing the document at the specified URL will
    /// be brought to the front.
    ///
    /// - Parameter url: A file URL which points to an existing document.
    public func callAsFunction(at url: URL) async throws {
        fatalError()
    }
}

extension OpenDocumentAction : Equatable {
    public static func == (_ lhs: OpenDocumentAction, _ rhs: OpenDocumentAction) -> Bool {
        ObjectIdentifier(type(of: lhs.self)) == ObjectIdentifier(type(of: rhs.self))
    }
}