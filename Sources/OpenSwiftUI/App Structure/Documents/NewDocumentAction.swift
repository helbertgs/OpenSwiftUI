import Swift

@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct NewDocumentAction : Equatable, Hashable {

    /// Presents a new document window, using the provided closure to specify
    /// the initial document contents.
    ///
    /// In order to present the document, your ``App`` must define a
    /// ``DocumentGroup`` with the editor role for the type of the presented
    /// value.
    ///
    /// - Parameter newDocument: The initial document to use when the window is
    ///   presented.
    public func callAsFunction<D>(_ newDocument: @autoclosure @escaping () -> D) async where D : FileDocument {
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
    public func callAsFunction<D>(_ newDocument: @escaping () -> D) async where D : ReferenceFileDocument {
        fatalError()
    }
}