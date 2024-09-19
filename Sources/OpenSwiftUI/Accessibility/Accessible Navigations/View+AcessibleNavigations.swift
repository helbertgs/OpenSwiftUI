import Foundation

extension View {

    // MARK: - Working with rotors

    /// Create an Accessibility Rotor with the specified user-visible label, and entries generated from the content closure.
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - entries: Content used to generate Rotor entries. This can include AccessibilityRotorEntry structs, as well as constructs such as if and ForEach.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<Content>(_ label: Text, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where Content : AccessibilityRotorContent {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label, and entries generated from the content closure.
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - entries: Content used to generate Rotor entries. This can include AccessibilityRotorEntry structs, as well as constructs such as if and ForEach.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<Content>(_ labelKey: LocalizedStringKey, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where Content : AccessibilityRotorContent {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label, and entries generated from the content closure.
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - entries: Content used to generate Rotor entries. This can include AccessibilityRotorEntry structs, as well as constructs such as if and ForEach.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<Content>(_ systemRotor: AccessibilitySystemRotor, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where Content : AccessibilityRotorContent {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label, and entries generated from the content closure.
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - entries: Content used to generate Rotor entries. This can include AccessibilityRotorEntry structs, as well as constructs such as if and ForEach.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<L, Content>(_ label: L, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where L : StringProtocol, Content : AccessibilityRotorContent {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries.
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of values that will be used to generate the entries of the Rotor.
    ///   - entryID: Key path on the entry type that can be used to generate an identifier for the Entry. The identifiers must match up with identifiers in ForEach or explicit id calls within the ScrollView.
    ///   - entryLabel: Key path on the entry type that can be used to get a user-visible label for every Rotor entry. This is used on macOS when the user opens the list of entries for the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<EntryModel, ID>(_ rotorLabel: Text, entries: [EntryModel], entryID: KeyPath<EntryModel, ID>, entryLabel: KeyPath<EntryModel, String>) -> some View where ID : Hashable {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries.
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of values that will be used to generate the entries of the Rotor.
    ///   - entryID: Key path on the entry type that can be used to generate an identifier for the Entry. The identifiers must match up with identifiers in ForEach or explicit id calls within the ScrollView.
    ///   - entryLabel: Key path on the entry type that can be used to get a user-visible label for every Rotor entry. This is used on macOS when the user opens the list of entries for the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<EntryModel, ID>(_ rotorLabelKey: LocalizedStringKey, entries: [EntryModel], entryID: KeyPath<EntryModel, ID>, entryLabel: KeyPath<EntryModel, String>) -> some View where ID : Hashable {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries.
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of values that will be used to generate the entries of the Rotor.
    ///   - entryID: Key path on the entry type that can be used to generate an identifier for the Entry. The identifiers must match up with identifiers in ForEach or explicit id calls within the ScrollView.
    ///   - entryLabel: Key path on the entry type that can be used to get a user-visible label for every Rotor entry. This is used on macOS when the user opens the list of entries for the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<EntryModel, ID>(_ systemRotor: AccessibilitySystemRotor, entries: [EntryModel], entryID: KeyPath<EntryModel, ID>, entryLabel: KeyPath<EntryModel, String>) -> some View where ID : Hashable {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries.
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of values that will be used to generate the entries of the Rotor.
    ///   - entryID: Key path on the entry type that can be used to generate an identifier for the Entry. The identifiers must match up with identifiers in ForEach or explicit id calls within the ScrollView.
    ///   - entryLabel: Key path on the entry type that can be used to get a user-visible label for every Rotor entry. This is used on macOS when the user opens the list of entries for the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<L, EntryModel, ID>(_ rotorLabel: L, entries: [EntryModel], entryID: KeyPath<EntryModel, ID>, entryLabel: KeyPath<EntryModel, String>) -> some View where L : StringProtocol, ID : Hashable {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries.
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of identifiable values that will be used to generate the entries of the Rotor. The identifiers of the Identifiable values must match up with identifiers in a ForEach or explicit id calls within the ScrollView. When the user navigates to entries from this Rotor, SwiftUI will automatically scroll them into place as needed.
    ///   - entryLabel: Key path on the Identifiable type that can be used to get a user-visible label for every Rotor entry. This is used on macOS when the user opens the list of entries for the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<EntryModel>(_ rotorLabel: Text, entries: [EntryModel],entryLabel: KeyPath<EntryModel, String>) -> some View where EntryModel : Identifiable {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries.
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of identifiable values that will be used to generate the entries of the Rotor. The identifiers of the Identifiable values must match up with identifiers in a ForEach or explicit id calls within the ScrollView. When the user navigates to entries from this Rotor, SwiftUI will automatically scroll them into place as needed.
    ///   - entryLabel: Key path on the Identifiable type that can be used to get a user-visible label for every Rotor entry. This is used on macOS when the user opens the list of entries for the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<EntryModel>(_ rotorLabelKey: LocalizedStringKey, entries: [EntryModel],entryLabel: KeyPath<EntryModel, String>) -> some View where EntryModel : Identifiable {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries.
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of identifiable values that will be used to generate the entries of the Rotor. The identifiers of the Identifiable values must match up with identifiers in a ForEach or explicit id calls within the ScrollView. When the user navigates to entries from this Rotor, SwiftUI will automatically scroll them into place as needed.
    ///   - entryLabel: Key path on the Identifiable type that can be used to get a user-visible label for every Rotor entry. This is used on macOS when the user opens the list of entries for the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<EntryModel>(_ systemRotor: AccessibilitySystemRotor, entries: [EntryModel],entryLabel: KeyPath<EntryModel, String>) -> some View where EntryModel : Identifiable {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries.
    /// - Parameters:
    ///   - rotorLabel: Localized label identifying this Rotor to the user.
    ///   - entries: An array of identifiable values that will be used to generate the entries of the Rotor. The identifiers of the Identifiable values must match up with identifiers in a ForEach or explicit id calls within the ScrollView. When the user navigates to entries from this Rotor, SwiftUI will automatically scroll them into place as needed.
    ///   - entryLabel: Key path on the Identifiable type that can be used to get a user-visible label for every Rotor entry. This is used on macOS when the user opens the list of entries for the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<L, EntryModel>(_ rotorLabel: L, entries: [EntryModel],entryLabel: KeyPath<EntryModel, String>) -> some View where L : StringProtocol, EntryModel : Identifiable {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries for each of the specified ranges. 
    /// The Rotor will be attached to the current Accessibility element, and each entry will go the specified range of that element.
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - textRanges: An array of ranges that will be used to generate the entries of the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor(_ label: Text, textRanges: [Range<String.Index>]) -> some View {
        modifier(EmptyModifier())

    }
    /// Create an Accessibility Rotor with the specified user-visible label and entries for each of the specified ranges. 
    /// The Rotor will be attached to the current Accessibility element, and each entry will go the specified range of that element.
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - textRanges: An array of ranges that will be used to generate the entries of the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor(_ labelKey: LocalizedStringKey, textRanges: [Range<String.Index>]) -> some View {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries for each of the specified ranges. 
    /// The Rotor will be attached to the current Accessibility element, and each entry will go the specified range of that element.
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - textRanges: An array of ranges that will be used to generate the entries of the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor(_ systemRotor: AccessibilitySystemRotor, textRanges: [Range<String.Index>]) -> some View {
        modifier(EmptyModifier())
    }

    /// Create an Accessibility Rotor with the specified user-visible label and entries for each of the specified ranges. 
    /// The Rotor will be attached to the current Accessibility element, and each entry will go the specified range of that element.
    /// - Parameters:
    ///   - label: Localized label identifying this Rotor to the user.
    ///   - textRanges: An array of ranges that will be used to generate the entries of the Rotor.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotor<L>(_ label: L, textRanges: [Range<String.Index>]) -> some View where L : StringProtocol {
        modifier(EmptyModifier())
    }

    // MARK: - Configuring rotors

    /// Defines an explicit identifier tying an Accessibility element for this view to an entry in an Accessibility Rotor.
    /// - Parameters:
    ///   - id: An arbitrary hashable identifier. Pass this same value when initializing an AccessibilityRotorEntry.
    ///   - namespace: A namespace created with @Namespace(). Pass this same namespace when initializing an AccessibilityRotorEntry.
    /// - Returns: The modified view.
    nonisolated public func accessibilityRotorEntry<ID>(id: ID, in namespace: Namespace.ID) -> some View where ID : Hashable {
        modifier(EmptyModifier())
    }

    /// Links multiple accessibility elements so that the user can quickly navigate from one element to another, even when the elements are not near each other in the accessibility hierarchy.
    /// This can be useful to allow quickly jumping between content in a list and the same content shown in a detail view, for example. 
    /// All elements marked with accessibilityLinkedGroup with the same namespace and identifier will be linked together.
    /// - Parameters:
    ///   - id: A hashable identifier used to separate sets of linked elements within the same namespace. Elements with matching namespace and id will be linked together.
    ///   - namespace: The namespace to use to organize linked accessibility elements. All elements marked with accessibilityLink in this namespace and with the specified id will be linked together.
    /// - Returns: The modified view.
    nonisolated public  func accessibilityLinkedGroup<ID>(id: ID, in namespace: Namespace.ID) -> some View where ID : Hashable {
        modifier(EmptyModifier())
    }

    /// Sets the sort priority order for this view’s accessibility element, relative to other elements at the same level.
    /// Higher numbers are sorted first. The default sort priority is zero.
    nonisolated public func accessibilitySortPriority(_ sortPriority: Double) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }
}