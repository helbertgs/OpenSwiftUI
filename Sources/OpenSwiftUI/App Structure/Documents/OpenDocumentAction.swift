import Foundation
import Swift

@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(Windows, unavailable)
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

@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(Windows, unavailable)
extension EnvironmentValues {
    /// An action that presents an existing document.
    ///
    /// In order to present an existing document, your ``App`` must define a
    /// ``DocumentGroup`` which handles the content type of the specified file.
    ///
    /// Use the ``EnvironmentValues/openDocument`` environment value to get the
    /// instance of this structure for a given ``Environment``. Then call the
    /// instance to present an existing document. You call the instance directly
    /// because it defines a ``OpenDocumentAction/callAsFunction(at:)``
    /// method that Swift calls when you call the instance.
    ///
    /// For example, you can define a list of recent documents to open:
    ///
    ///     struct RecentDocuments: View {
    ///         var documentURLs: [URL]
    ///         @Environment(\.openDocument) private var openDocument
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 ForEach(documentURLs) { url in
    ///                     Button(url.deletingPathExtension().lastPathComponent)
    ///                     {
    ///                         Task {
    ///                            do {
    ///                                try openDocument(at: url)
    ///                            } catch {
    ///                                // Handle error
    ///                            }
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    public var openDocument: OpenDocumentAction {
        fatalError()
    }
}
