import Swift

@available(iOS, unavailable)
@frozen public struct NewDocumentActionKey : EnvironmentKey {
    public static var defaultValue: NewDocumentAction {
        .init()
    }
}

@available(iOS, unavailable)
extension EnvironmentValues {

    /// An action that presents a new document.
    ///
    /// In order to present the document, your ``App`` must define a
    /// ``DocumentGroup`` with the editor role for the type of the presented
    /// value.
    ///
    /// Use the ``EnvironmentValues/newDocument`` environment value to get the
    /// instance of this structure for a given ``Environment``. Then call the
    /// instance to present a new document. You call the instance directly
    /// because it defines a ``NewDocumentAction/callAsFunction(_:)-3h5h6``
    /// method that Swift calls when you call the instance.
    ///
    /// For example, you can define a button which creates a new document from
    /// the selected text:
    ///
    ///     struct NewDocumentFromSelection: View {
    ///         @FocusedBinding(\.selectedText) private var selectedText: String
    ///         @Environment(\.newDocument) private var newDocument
    ///
    ///         var body: some View {
    ///             Button("New Document With Selection") {
    ///                 newDocument(TextDocument(text: selectedText))
    ///             }
    ///             .disabled(selectedText.isEmpty)
    ///         }
    ///     }
    public var newDocument: NewDocumentAction {
        get { self[NewDocumentActionKey.self] }
    }
}
