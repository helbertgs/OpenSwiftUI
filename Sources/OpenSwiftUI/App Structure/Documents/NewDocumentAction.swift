import Swift

@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct NewDocumentAction {

    /// Presents a new document window, using the provided closure to specify
    /// the initial document contents.
    ///
    /// In order to present the document, your ``App`` must define a
    /// ``DocumentGroup`` with the editor role for the type of the presented
    /// value.
    ///
    /// - Parameter newDocument: The initial document to use when the window is
    ///   presented.
    public func callAsFunction<D>(_ newDocument: @autoclosure @escaping () -> D) where D : FileDocument {
        fatalError()
    }

    /// Presents a new document window, using the provided closure to specify
    /// the initial document contents.
    ///
    /// In order to present the document, your ``App`` must define a
    /// ``DocumentGroup`` with the editor role for the type of the presented
    /// value.
    ///
    /// - Parameter newDocument: The initial document to use when the window is
    ///   presented.
    public func callAsFunction<D>(_ newDocument: @escaping () -> D) where D : ReferenceFileDocument {
        fatalError()
    }
}

@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
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
        fatalError()
    }
}
