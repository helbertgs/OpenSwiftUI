import Swift

/// An action that can end a search interaction.
///
/// Use the ``EnvironmentValues/dismissSearch`` environment value to get the
/// instance of this structure for a given ``Environment``. Then call the
/// instance to dismiss the current search interaction. You call the instance
/// directly because it defines a ``DismissSearchAction/callAsFunction()``
/// method that Swift calls when you call the instance.
///
/// When you dismiss search, SwiftUI:
///
/// * Sets ``EnvironmentValues/isSearching`` to `false`.
/// * Clears any text from the search field.
/// * Removes focus from the search field.
///
/// > Note: Calling this instance has no effect if the user isn't
/// interacting with a search field.
///
/// Use this action to dismiss a search operation based on
/// another user interaction. For example, consider a searchable
/// view with a ``Button`` that presents more information about the first
/// matching item from a collection:
///
///     struct ContentView: View {
///         @State private var text = ""
///
///         var body: some View {
///             NavigationView {
///                 SearchResults(searchText: text)
///                     .searchable(text: $text)
///             }
///         }
///     }
///
///     private struct SearchResults: View {
///         let searchText: String
///
///         let items = ["a", "b", "c"]
///         var filteredItems: [String] { items.filter { $0 == searchText.lowercased() } }
///
///         @State private var isPresented = false
///
///         var body: some View {
///             if let item = filteredItems.first {
///                 Button("Details about \(item)") {
///                     isPresented = true
///                 }
///                 .sheet(isPresented: $isPresented) {
///                     NavigationView {
///                         DetailView(item: item)
///                     }
///                 }
///             }
///         }
///     }
///
/// The button becomes visible only after the user enters search text
/// that produces a match. When the user taps the button, SwiftUI shows
/// a sheet that provides more information about the item, including
/// an Add button for adding the item to a stored list of items:
///
///     private struct DetailView: View {
///         let item: String
///
///         @Environment(\.dismiss) private var dismiss
///         @Environment(\.dismissSearch) private var dismissSearch
///
///         var body: some View {
///             Text("Information about \(item).")
///                 .toolbar {
///                     Button("Add") {
///                         // Store the item here...
///
///                         dismiss()
///                         dismissSearch()
///                     }
///                 }
///         }
///     }
///
/// The user can dismiss the sheet by dragging it down, effectively
/// canceling the operation, leaving the in-progress search interaction
/// intact. Alternatively, the user can tap the Add button to store the
/// item. Because the user is likely to be done with both the detail view
/// and the search interaction at this point, the button's closure also
/// uses the ``EnvironmentValues/dismiss`` property to dismiss the sheet,
/// and the ``EnvironmentValues/dismissSearch`` property to reset the
/// search field.
public struct DismissSearchAction {

    // MARK: - Property(ies).

    var onDismiss: (() -> Void)?

    // MARK: - Constructor(s).

    public init(onDismiss: (() -> Void)? = nil) {
        self.onDismiss = onDismiss
    }

    // MARK: - Function(s).

    /// Dismisses the current search operation, if any.
    ///
    /// Don't call this method directly. SwiftUI calls it for you when you
    /// call the ``DismissSearchAction`` structure that you get from the
    /// ``Environment``:
    ///
    ///     private struct SearchedView: View {
    ///         @Environment(\.dismissSearch) private var dismissSearch
    ///
    ///         var body: some View {
    ///             Button("Cancel") {
    ///                 dismissSearch() // Implicitly calls dismissSearch.callAsFunction()
    ///             }
    ///         }
    ///     }
    ///
    /// For information about how Swift uses the `callAsFunction()` method to
    /// simplify call site syntax, see
    /// [Methods with Special Names](https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#ID622)
    /// in *The Swift Programming Language*.
    public func callAsFunction() {
        onDismiss?()
    }
}

extension EnvironmentValues {

    /// A Boolean value that indicates when the user is searching.
    ///
    /// You can read this value like any of the other ``EnvironmentValues``,
    /// by creating a property with the ``Environment`` property wrapper:
    ///
    ///     @Environment(\.isSearching) private var isSearching
    ///
    /// Get the value to find out when the user interacts with a search
    /// field that's produced by one of the searchable modifiers, like
    /// ``View/searchable(text:placement:prompt:)-18a8f``:
    ///
    ///     struct SearchingExample: View {
    ///         @State private var text = ""
    ///
    ///         var body: some View {
    ///             NavigationView {
    ///                 SearchedView()
    ///                     .searchable(text: $text)
    ///             }
    ///         }
    ///     }
    ///
    ///     struct SearchedView: View {
    ///         @Environment(\.isSearching) private var isSearching
    ///
    ///         var body: some View {
    ///             Text(isSearching ? "Searching!" : "Not searching.")
    ///         }
    ///     }
    ///
    /// When the user first taps or clicks in a search field, the
    /// `isSearching` property becomes `true`. When the user cancels the
    /// search operation, the property becomes `false`. To programmatically
    /// set the value to `false` and dismiss the search operation, use
    /// ``EnvironmentValues/dismissSearch``.
    public var isSearching: Bool {
        fatalError("")
    }
}

extension DismissSearchAction : Equatable {
    public static func == (_ lhs: DismissSearchAction, _ rhs: DismissSearchAction) -> Bool {
        ObjectIdentifier(type(of: lhs.self)) == ObjectIdentifier(type(of: rhs.self))
    }
}