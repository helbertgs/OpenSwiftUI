import Swift

/// An action that dismisses a presentation.
///
/// Use the ``EnvironmentValues/dismiss`` environment value to get the instance
/// of this structure for a given ``Environment``. Then call the instance
/// to perform the dismissal. You call the instance directly because
/// it defines a ``DismissAction/callAsFunction()``
/// method that Swift calls when you call the instance.
///
/// For example, you can create a button that calls the ``DismissAction``:
///
///     private struct SheetContents: View {
///         @Environment(\.dismiss) private var dismiss
///
///         var body: some View {
///             Button("Done") {
///                 dismiss()
///             }
///         }
///     }
///
/// If you present the `SheetContents` view in a sheet, the user can dismiss
/// the sheet by tapping or clicking the sheet's button:
///
///     private struct DetailView: View {
///         @State private var isSheetPresented = false
///
///         var body: some View {
///             Button("Show Sheet") {
///                 isSheetPresented = true
///             }
///             .sheet(isPresented: $isSheetPresented) {
///                 SheetContents()
///             }
///         }
///     }
///
/// Be sure that you define the action in the appropriate environment.
/// For example, don't reorganize the `DetailView` in the example above
/// so that it creates the `dismiss` property and calls it from the
/// ``View/sheet(item:onDismiss:content:)`` view modifier's `content`
/// closure:
///
///     private struct DetailView: View {
///         @State private var isSheetPresented = false
///         @Environment(\.dismiss) private var dismiss // Applies to DetailView.
///
///         var body: some View {
///             Button("Show Sheet") {
///                 isSheetPresented = true
///             }
///             .sheet(isPresented: $isSheetPresented) {
///                 Button("Done") {
///                     dismiss() // Fails to dismiss the sheet.
///                 }
///             }
///         }
///     }
///
/// If you do this, the sheet fails to dismiss because the action applies
/// to the environment where you declared it, which is that of the detail
/// view, rather than the sheet. In fact, if you've presented the detail
/// view in a ``NavigationView``, the dismissal pops the detail view
/// from the navigation stack.
///
/// The dismiss action has no effect on a view that isn't currently
/// presented. If you need to query whether OpenSwiftUI is currently presenting
/// a view, read the ``EnvironmentValues/isPresented`` environment value.
public struct DismissAction {

    // MARK: - Property(ies).

    @usableFromInline
    var action: (() -> Void)?

    // MARK: - Constructor(s).

    @inlinable
    public init(action: (() -> Void)? = nil) {
        self.action = action
    }

    // MARK: - Function(s).

    /// Dismisses the view if it is currently presented.
    ///
    /// Don't call this method directly. OpenSwiftUI calls it for you when you
    /// call the ``DismissAction`` structure that you get from the
    /// ``Environment``:
    ///
    ///     private struct SheetContents: View {
    ///         @Environment(\.dismiss) private var dismiss
    ///
    ///         var body: some View {
    ///             Button("Done") {
    ///                 dismiss() // Implicitly calls dismiss.callAsFunction()
    ///             }
    ///         }
    ///     }
    ///
    /// For information about how Swift uses the `callAsFunction()` method to
    /// simplify call site syntax, see
    /// [Methods with Special Names](https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#ID622)
    /// in *The Swift Programming Language*.
    @inlinable public func callAsFunction() {
        action?()
    }
}

extension EnvironmentValues {
    /// An action that dismisses the current presentation.
    ///
    /// Use this environment value to get the ``DismissAction`` instance
    /// for the current ``Environment``. Then call the instance
    /// to perform the dismissal. You call the instance directly because
    /// it defines a ``DismissAction/callAsFunction()``
    /// method that Swift calls when you call the instance.
    ///
    /// For example, you can create a button that calls the ``DismissAction``:
    ///
    ///     private struct SheetContents: View {
    ///         @Environment(\.dismiss) private var dismiss
    ///
    ///         var body: some View {
    ///             Button("Done") {
    ///                 dismiss()
    ///             }
    ///         }
    ///     }
    ///
    /// If you present the `SheetContents` view in a sheet, the user can dismiss
    /// the sheet by tapping or clicking the sheet's button:
    ///
    ///     private struct DetailView: View {
    ///         @State private var isSheetPresented = false
    ///
    ///         var body: some View {
    ///             Button("Show Sheet") {
    ///                 isSheetPresented = true
    ///             }
    ///             .sheet(isPresented: $isSheetPresented) {
    ///                 SheetContents()
    ///             }
    ///         }
    ///     }
    ///
    /// Be sure that you define the action in the appropriate environment.
    /// For example, don't reorganize the `DetailView` in the example above
    /// so that it creates the `dismiss` property and calls it from the
    /// ``View/sheet(item:onDismiss:content:)`` view modifier's `content`
    /// closure:
    ///
    ///     private struct DetailView: View {
    ///         @State private var isSheetPresented = false
    ///         @Environment(\.dismiss) private var dismiss // Applies to DetailView.
    ///
    ///         var body: some View {
    ///             Button("Show Sheet") {
    ///                 isSheetPresented = true
    ///             }
    ///             .sheet(isPresented: $isSheetPresented) {
    ///                 Button("Done") {
    ///                     dismiss() // Fails to dismiss the sheet.
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// If you do this, the sheet fails to dismiss because the action applies
    /// to the environment where you declared it, which is that of the detail
    /// view, rather than the sheet. In fact, if you've presented the detail
    /// view in a ``NavigationView``, the dismissal pops the detail view
    /// the navigation stack.
    ///
    /// The dismiss action has no effect on a view that isn't currently
    /// presented. If you need to query whether OpenSwiftUI is currently presenting
    /// a view, read the ``EnvironmentValues/isPresented`` environment value.
    public var dismiss: DismissAction {
        fatalError("")
    }
}
