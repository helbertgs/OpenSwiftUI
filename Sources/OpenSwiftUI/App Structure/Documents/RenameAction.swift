import Swift

/// An action that activates a standard rename interaction.
///
/// Use the ``View/renameAction(_:)-6lghl`` modifier to configure the rename
/// action in the environment.
public struct RenameAction {

    // MARK: - Property(ies).

    @usableFromInline
    internal var action: () -> Void

    // MARK: - Constructor(s).

    @usableFromInline
    internal init(action: @escaping () -> Void) {
        self.action = action
    }

    /// Triggers the standard rename action provided through the environment.
    public func callAsFunction() {
        action()
    }
}

extension View {
    /// Sets the rename action in the environment to update focus state.
    ///
    /// Use this modifier in conjunction with the ``RenameButton`` to implement
    /// standard rename interactions. A rename button receives its action
    /// from the environment. Use this modifier to customize the action
    /// provided to the rename button.
    ///
    ///     struct RowView: View {
    ///         @State private var text = ""
    ///         @FocusState private var isFocused: Bool
    ///
    ///         var body: some View {
    ///             TextField(text: $item.name) {
    ///                 Text("Prompt")
    ///             }
    ///             .focused($isFocused)
    ///             .contextMenu {
    ///                 RenameButton()
    ///                 // ... your own custom actions
    ///             }
    ///             .renameAction($isFocused)
    ///     }
    ///
    /// When someone taps the rename button in the context menu, the rename
    /// action focuses the text field by setting the `isFocused`
    /// property to true.
    ///
    /// - Parameter isFocused: The focus binding to update when
    ///   activating the rename action.
    ///
    /// - Returns: A view that has the specified rename action.
//    public func renameAction(_ isFocused: FocusState<Bool>.Binding) -> some View {
//        fatalError()
//    }

    /// Sets a closure to run for the rename action.
    ///
    /// Use this modifier in conjunction with the ``RenameButton`` to implement
    /// standard rename interactions. A rename button receives its action
    /// from the environment. Use this modifier to customize the action
    /// provided to the rename button.
    ///
    ///     struct RowView: View {
    ///         @State private var text = ""
    ///         @FocusState private var isFocused: Bool
    ///
    ///         var body: some View {
    ///             TextField(text: $item.name) {
    ///                 Text("Prompt")
    ///             }
    ///             .focused($isFocused)
    ///             .contextMenu {
    ///                 RenameButton()
    ///                 // ... your own custom actions
    ///             }
    ///             .renameAction { isFocused = true }
    ///     }
    ///
    /// When the user taps the rename button in the context menu, the rename
    /// action focuses the text field by setting the `isFocused`
    /// property to true.
    ///
    /// - Parameter action: A closure to run when renaming.
    ///
    /// - Returns: A view that has the specified rename action.
    public func renameAction(_ action: @escaping () -> Void) -> some View {
        environment(\.rename, RenameAction(action: action))
    }
}

extension RenameAction : Equatable {
    public static func == (_ lhs: RenameAction, _ rhs: RenameAction) -> Bool {
        ObjectIdentifier(type(of: lhs.self)) == ObjectIdentifier(type(of: rhs.self))
    }
}