import Swift

@frozen public struct OpenDocumentActionKey : EnvironmentKey {
    public static var defaultValue: OpenDocumentAction {
        .init()
    }
}

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
        get { self[OpenDocumentActionKey.self] }
    }
}
