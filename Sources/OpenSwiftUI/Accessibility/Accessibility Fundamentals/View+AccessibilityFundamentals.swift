import Foundation

extension View {

    // MARK: - Creating accessible elements

    /// Creates a new accessibility element, or modifies the AccessibilityChildBehavior of the existing accessibility element.
    /// - Parameter children: The behavior to use when creating or transforming an accessibility element. The default is ignore
    nonisolated public func accessibilityElement(children: AccessibilityChildBehavior = .ignore) -> some View {
        fatalError()
    }

    /// Replaces the existing accessibility element’s children with one or more new synthetic accessibility elements.
    /// - Parameter children: A ViewBuilder that represents the replacement child views the framework uses to generate accessibility elements.
    nonisolated public func accessibilityChildren<V>(@ViewBuilder children: () -> V) -> some View where V : View {
        fatalError()
    }

    /// Replaces one or more accessibility elements for this view with new accessibility elements.
    /// - Parameter representation: A hidden view that the accessibility system uses to generate accessibility elements.
    nonisolated public func accessibilityRepresentation<V>(@ViewBuilder representation: () -> V) -> some View where V : View {
        fatalError()
    }

    // MARK: - Identifying elements
    
    /// Uses the string you specify to identify the view.
    /// Use this value for testing. It isn’t visible to the user.
    nonisolated public func accessibilityIdentifier(_ identifier: String) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// Uses the string you specify to identify the view.
    /// Use this value for testing. It isn’t visible to the user.
    /// - Parameters:
    ///   - identifier: The accessibility identifier to apply.
    ///   - isEnabled: If true the accessibility identifier is applied; otherwise the accessibility identifier is unchanged.
    nonisolated public func accessibilityIdentifier(_ identifier: String, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    // MARK: - Hiding elements

    /// Specifies whether to hide this view from system accessibility features.
    nonisolated public func accessibilityHidden(_ hidden: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// Specifies whether to hide this view from system accessibility features.
    /// - Parameters:
    ///   - hidden: Whether to hide this view from accessibility features.
    ///   - isEnabled: If true the accessibility hidden state is applied; otherwise the accessibility hidden state is unchanged.
    nonisolated public func accessibilityHidden(_ hidden: Bool, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }
}