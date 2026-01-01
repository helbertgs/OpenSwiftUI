import Foundation

/// A struct representing an entry in an Accessibility Rotor.
public struct AccessibilityRotorEntry<ID> where ID : Hashable {

    // MARK: - Creating a rotor entry

    /// Create a Rotor entry with a specific label and range. This Rotor entry will be associated with the Accessibility element that owns the Rotor.
    /// - Parameters:
    ///   - label: Optional localized string used to show this Rotor entry to users. If no label is specified, the Rotor entry will be labeled based on the text at that range.
    ///   - textRange: Optional range of text associated with this Rotor entry. This should be a range within text that is set as the either label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry is navigated to, to prepare the UI as needed. This can be used to bring the UI element or text on-screen if it isn’t already, and SwiftUI not able to automatically scroll to it.
    public init(_ label: Text? = nil, textRange: Range<String.Index>, prepare: @escaping (() -> Void) = {}) where ID == Never {
    }

    /// Create a Rotor entry with a specific label and range. This Rotor entry will be associated with the Accessibility element that owns the Rotor.
    /// - Parameters:
    ///   - label: Optional localized string used to show this Rotor entry to users. If no label is specified, the Rotor entry will be labeled based on the text at that range.
    ///   - textRange: Optional range of text associated with this Rotor entry. This should be a range within text that is set as the either label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry is navigated to, to prepare the UI as needed. This can be used to bring the UI element or text on-screen if it isn’t already, and SwiftUI not able to automatically scroll to it.
    public init(_ labelKey: LocalizedStringKey, textRange: Range<String.Index>, prepare: @escaping (() -> Void) = {}) {
    }

    /// Create a Rotor entry with a specific label and range. This Rotor entry will be associated with the Accessibility element that owns the Rotor.
    /// - Parameters:
    ///   - label: Optional localized string used to show this Rotor entry to users. If no label is specified, the Rotor entry will be labeled based on the text at that range.
    ///   - textRange: Optional range of text associated with this Rotor entry. This should be a range within text that is set as the either label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry is navigated to, to prepare the UI as needed. This can be used to bring the UI element or text on-screen if it isn’t already, and SwiftUI not able to automatically scroll to it.
    public init<L>(_ label: L, textRange: Range<String.Index>, prepare: @escaping (() -> Void) = {}) where ID == Never, L : StringProtocol     {
    }

    /// Create a Rotor entry with a specific label and identifier, with an optional range.
    /// - Parameters:
    ///   - labelKey: Localized string used to show this Rotor entry to users.
    ///   - id: Used to find the UI element associated with this Rotor entry. This identifier should be used within a scrollView, either in a ForEach or using an id call.
    ///   - textRange: Optional range of text associated with this Rotor entry. This should be a range within text that is set as the either label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry is navigated to, to prepare the UI as needed. This can be used to bring the UI element on-screen if it isn’t already, and SwiftUI is not able to automatically scroll to it.
    public init(_ label: Text, id: ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) {
    }

    /// Create a Rotor entry with a specific label and identifier, with an optional range.
    /// - Parameters:
    ///   - labelKey: Localized string used to show this Rotor entry to users.
    ///   - id: Used to find the UI element associated with this Rotor entry. This identifier should be used within a scrollView, either in a ForEach or using an id call.
    ///   - textRange: Optional range of text associated with this Rotor entry. This should be a range within text that is set as the either label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry is navigated to, to prepare the UI as needed. This can be used to bring the UI element on-screen if it isn’t already, and SwiftUI is not able to automatically scroll to it.
    public init(_ labelKey: LocalizedStringKey, id: ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) {
    }

    /// Create a Rotor entry with a specific label and identifier, with an optional range.
    /// - Parameters:
    ///   - labelKey: Localized string used to show this Rotor entry to users.
    ///   - id: Used to find the UI element associated with this Rotor entry. This identifier should be used within a scrollView, either in a ForEach or using an id call.
    ///   - textRange: Optional range of text associated with this Rotor entry. This should be a range within text that is set as the either label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry is navigated to, to prepare the UI as needed. This can be used to bring the UI element on-screen if it isn’t already, and SwiftUI is not able to automatically scroll to it.
    public init<L>(_ label: L, id: ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) where L : StringProtocol {
    }

    // MARK: - Creating an identified rotor entry in a namespace

    /// Create a Rotor entry with a specific label, identifier and namespace, and with an optional range.
    /// - Parameters:
    ///   - label: Localized string used to show this Rotor entry to users.
    ///   - id: Used to find the UI element associated with this Rotor entry. This identifier and namespace should match a call to accessibilityRotorEntry(id:in).
    ///   - namespace: Namespace for this identifier. Should match a call to accessibilityRotorEntry(id:in).
    ///   - textRange: Optional range of text associated with this Rotor entry. This should be a range within text that is set as the accessibility label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry is navigated to, to prepare the UI as needed. This should be used to bring the Accessibility element on-screen, if scrolling is needed to get to it.
    public init(_ label: Text, id: ID, in namespace: Namespace.ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) {
    }

    /// Create a Rotor entry with a specific label, identifier and namespace, and with an optional range.
    /// - Parameters:
    ///   - label: Localized string used to show this Rotor entry to users.
    ///   - id: Used to find the UI element associated with this Rotor entry. This identifier and namespace should match a call to accessibilityRotorEntry(id:in).
    ///   - namespace: Namespace for this identifier. Should match a call to accessibilityRotorEntry(id:in).
    ///   - textRange: Optional range of text associated with this Rotor entry. This should be a range within text that is set as the accessibility label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry is navigated to, to prepare the UI as needed. This should be used to bring the Accessibility element on-screen, if scrolling is needed to get to it.
    public init(_ labelKey: LocalizedStringKey, id: ID, in namespace: Namespace.ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) {
    }

    /// Create a Rotor entry with a specific label, identifier and namespace, and with an optional range.
    /// - Parameters:
    ///   - label: Localized string used to show this Rotor entry to users.
    ///   - id: Used to find the UI element associated with this Rotor entry. This identifier and namespace should match a call to accessibilityRotorEntry(id:in).
    ///   - namespace: Namespace for this identifier. Should match a call to accessibilityRotorEntry(id:in).
    ///   - textRange: Optional range of text associated with this Rotor entry. This should be a range within text that is set as the accessibility label or accessibility value of the associated element.
    ///   - prepare: Optional closure to run before a Rotor entry is navigated to, to prepare the UI as needed. This should be used to bring the Accessibility element on-screen, if scrolling is needed to get to it.
    public init<L>(_ label: L, _ id: ID, in namespace: Namespace.ID, textRange: Range<String.Index>? = nil, prepare: @escaping (() -> Void) = {}) where L : StringProtocol {
    }
}