import Swift

@available(iOS, unavailable)
public struct ResetFocusAction {

    // MARK: - Property(ies).

    @usableFromInline
    var onReset: (() -> Void)?

    // MARK: - Constructor(s).

    @usableFromInline
    init(onReset: (() -> Void)? = nil) {
        self.onReset = onReset
    }

    // MARK: - Function(s).

    /// Asks the focus sytem to reevaluate the default focus item.
    ///
    /// The focus system reevaluates default focus when the currently-focused
    /// item is within the provided namespace.
    ///
    /// - Parameter namespace: The namespace inside which SwiftUI should
    ///   reevaluate default focus. The namespace should match the
    ///   ``View/focusScope(_:)`` block where focus requires reevaluation.
    public func callAsFunction(in namespace: Namespace.ID) {
        fatalError()
    }
}

@available(iOS, unavailable)
extension EnvironmentValues {

    /// An action that requests the focus system to reevaluate default focus.
    ///
    /// Get this environment value and call and call it as a function to force
    /// a default focus reevaluation at runtime.
    ///
    ///     @Namespace var mainNamespace
    ///     @Environment(\.resetFocus) var resetFocus
    ///
    ///     var body: some View {
    ///         // ...
    ///         resetFocus(in: mainNamespace)
    ///         // ...
    ///     }
    ///
    public var resetFocus: ResetFocusAction {
        ResetFocusAction()
    }
}
