import Foundation

extension View {
    
    // MARK: - Applying labels

    /// Adds a label to the view that describes its contents.
    nonisolated public func accessibilityLabel(_ label: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Adds a label to the view that describes its contents.
    nonisolated public func accessibilityLabel(_ labelKey: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Adds a label to the view that describes its contents.
    nonisolated public func accessibilityLabel<S>(_ label: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Adds a label to the view that describes its contents.
    /// - Parameters:
    ///   - label: The accessibility label to apply.
    ///   - isEnabled: If true the accessibility label is applied; otherwise the accessibility label is unchanged.
    nonisolated public func accessibilityLabel(_ label: Text, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Adds a label to the view that describes its contents.
    /// - Parameters:
    ///   - label: The accessibility label to apply.
    ///   - isEnabled: If true the accessibility label is applied; otherwise the accessibility label is unchanged.
    nonisolated public func accessibilityLabel(_ labelKey: LocalizedStringKey, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Adds a label to the view that describes its contents.
    /// - Parameters:
    ///   - label: The accessibility label to apply.
    ///   - isEnabled: If true the accessibility label is applied; otherwise the accessibility label is unchanged.
    nonisolated public func accessibilityLabel<S>(_ label: S, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Adds a label to the view that describes its contents.
    /// - Parameter content: A view builder closure that takes a proxy value representing the modified view. You can combine the modified view with other content to create a new accessibility label for the original view.
    /// - Returns: The modified view.
    nonisolated public func accessibilityLabel<V>(@ViewBuilder content: (PlaceholderContentView<Self>) -> V) -> some View where V : View {
        modifier(EmptyModifier())
    }

    /// Sets alternate input labels with which users identify a view.
    nonisolated public func accessibilityInputLabels(_ inputLabelKeys: [LocalizedStringKey]) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Sets alternate input labels with which users identify a view.
    nonisolated public func accessibilityInputLabels(_ inputLabels: [Text]) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Sets alternate input labels with which users identify a view.
    nonisolated public func accessibilityInputLabels<S>(_ inputLabels: [S]) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Sets alternate input labels with which users identify a view.
    /// Provide labels in descending order of importance. Voice Control and Full Keyboard Access use the input labels.
    /// - Parameters:
    ///   - inputLabels: The accessibility input labels to apply.
    ///   - isEnabled: If true the accessibility input labels are applied; otherwise the accessibility input labels are unchanged.
    nonisolated public func accessibilityInputLabels(_ inputLabelKeys: [LocalizedStringKey], isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Sets alternate input labels with which users identify a view.
    /// Provide labels in descending order of importance. Voice Control and Full Keyboard Access use the input labels.
    /// - Parameters:
    ///   - inputLabels: The accessibility input labels to apply.
    ///   - isEnabled: If true the accessibility input labels are applied; otherwise the accessibility input labels are unchanged.
    nonisolated public func accessibilityInputLabels(_ inputLabels: [Text], isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Sets alternate input labels with which users identify a view.
    /// Provide labels in descending order of importance. Voice Control and Full Keyboard Access use the input labels.
    /// - Parameters:
    ///   - inputLabels: The accessibility input labels to apply.
    ///   - isEnabled: If true the accessibility input labels are applied; otherwise the accessibility input labels are unchanged.
    nonisolated public func accessibilityInputLabels<S>(_ inputLabels: [S], isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Pairs an accessibility element representing a label with the element for the matching content.
    /// - Parameters:
    ///   - role: Determines whether this element should be used as the label in the pair, or the content in the pair.
    ///   - id: The identifier for the label / content pair. Elements with matching identifiers within the same namespace will be paired together.
    ///   - namespace: The namespace used to organize label and content. Label and content under the same namespace with matching identifiers will be paired together.
    /// - Returns: The modified view.
    nonisolated public func accessibilityLabeledPair<ID>(role: AccessibilityLabeledPairRole, id: ID, in namespace: Namespace.ID) -> some View where ID : Hashable {
        modifier(EmptyModifier())
    }

    // MARK: - Describing values
    
    /// Adds a textual description of the value that the view contains.
    /// Use this method to describe the value represented by a view, but only if that’s different than the view’s label. For example, for a slider that you label as “Volume” using accessibilityLabel(), you can provide the current volume setting, like “60%”, using accessibilityValue().
    nonisolated public func accessibilityValue(_ valueDescription: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }
    
    /// Adds a textual description of the value that the view contains.
    ///  Use this method to describe the value represented by a view, but only if that’s different than the view’s label. For example, for a slider that you label as “Volume” using accessibilityLabel(), you can provide the current volume setting, like “60%”, using accessibilityValue().
    nonisolated public func accessibilityValue(_ valueKey: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }
    
    /// Adds a textual description of the value that the view contains.
    ///  Use this method to describe the value represented by a view, but only if that’s different than the view’s label. For example, for a slider that you label as “Volume” using accessibilityLabel(), you can provide the current volume setting, like “60%”, using accessibilityValue().
    nonisolated public func accessibilityValue<S>(_ value: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Adds a textual description of the value that the view contains.
    /// - Parameters:
    ///   - valueDescription: The accessibility value to apply.
    ///   - isEnabled: If true the accessibility value is applied; otherwise the accessibility value is unchanged.
    nonisolated public func accessibilityValue(_ valueDescription: Text, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Adds a textual description of the value that the view contains.
    /// - Parameters:
    ///   - valueDescription: The accessibility value to apply.
    ///   - isEnabled: If true the accessibility value is applied; otherwise the accessibility value is unchanged.
    nonisolated public func accessibilityValue(_ valueKey: LocalizedStringKey, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Adds a textual description of the value that the view contains.
    /// - Parameters:
    ///   - valueDescription: The accessibility value to apply.
    ///   - isEnabled: If true the accessibility value is applied; otherwise the accessibility value is unchanged.
    nonisolated public func accessibilityValue<S>(_ value: S, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    // MARK: - Describing content

    /// Sets an accessibility text content type.
    /// 
    /// Use this modifier to set the content type of this accessibility element. Assistive technologies can use this property to choose an appropriate way to output the text. For example, when encountering a source coding context, VoiceOver could choose to speak all punctuation.
    /// The default content type plain.
    /// - Parameter value: The accessibility content type from the available AccessibilityTextContentType options.
    nonisolated public func accessibilityTextContentType(_ value: AccessibilityTextContentType = .plain) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Sets the accessibility level of this heading.
    /// 
    /// levels AccessibilityHeadingLevel.h1 through AccessibilityHeadingLevel.h6 alongside the text.
    /// The default heading level if you don’t use this modifier is AccessibilityHeadingLevel.unspecified.
    /// - Parameter level: The heading level to associate with this element from the available AccessibilityHeadingLevel levels.
    nonisolated public func accessibilityHeading(_ level: AccessibilityHeadingLevel = .unspecified) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }
    
    // MARK: - Adding custom descriptions

    /// Add additional accessibility information to the view.
    /// - Parameters:
    ///   - key: Key used to specify the identifier and label of the of the additional accessibility information entry.
    ///   - value: Text value for the additional accessibility information. For example: “landscape.” A value of nil will remove any entry of additional information added earlier for any key with the same identifier.
    nonisolated public func accessibilityCustomContent(_ key: AccessibilityCustomContentKey, _ value: Text?, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Add additional accessibility information to the view.
    /// - Parameters:
    ///   - key: Key used to specify the identifier and label of the of the additional accessibility information entry.
    ///   - value: Text value for the additional accessibility information. For example: “landscape.” A value of nil will remove any entry of additional information added earlier for any key with the same identifier.
    nonisolated public func accessibilityCustomContent(_ key: AccessibilityCustomContentKey, _ valueKey: LocalizedStringKey, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Add additional accessibility information to the view.
    /// - Parameters:
    ///   - key: Key used to specify the identifier and label of the of the additional accessibility information entry.
    ///   - value: Text value for the additional accessibility information. For example: “landscape.” A value of nil will remove any entry of additional information added earlier for any key with the same identifier.
    nonisolated public func accessibilityCustomContent(_ label: Text, _ value: Text, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Add additional accessibility information to the view.
    /// - Parameters:
    ///   - key: Key used to specify the identifier and label of the of the additional accessibility information entry.
    ///   - value: Text value for the additional accessibility information. For example: “landscape.” A value of nil will remove any entry of additional information added earlier for any key with the same identifier.
    nonisolated public func accessibilityCustomContent(_ labelKey: LocalizedStringKey, _ value: Text, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Add additional accessibility information to the view.
    /// - Parameters:
    ///   - key: Key used to specify the identifier and label of the of the additional accessibility information entry.
    ///   - value: Text value for the additional accessibility information. For example: “landscape.” A value of nil will remove any entry of additional information added earlier for any key with the same identifier.
    nonisolated public func accessibilityCustomContent(_ labelKey: LocalizedStringKey, _ valueKey: LocalizedStringKey, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Add additional accessibility information to the view.
    /// - Parameters:
    ///   - key: Key used to specify the identifier and label of the of the additional accessibility information entry.
    ///   - value: Text value for the additional accessibility information. For example: “landscape.” A value of nil will remove any entry of additional information added earlier for any key with the same identifier.
    nonisolated public func accessibilityCustomContent<V>(_ key: AccessibilityCustomContentKey, _ value: V, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where V : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Add additional accessibility information to the view.
    /// - Parameters:
    ///   - key: Key used to specify the identifier and label of the of the additional accessibility information entry.
    ///   - value: Text value for the additional accessibility information. For example: “landscape.” A value of nil will remove any entry of additional information added earlier for any key with the same identifier.
    nonisolated public func accessibilityCustomContent<V>(_ labelKey: LocalizedStringKey, _ value: V, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where V : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    // MARK: - Assigning traits to content

    /// Adds the given traits to the view.
    nonisolated public func accessibilityAddTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Removes the given traits from this view.
    nonisolated public func accessibilityRemoveTraits(_ traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    // MARK: - Offering hints

    /// Communicates to the user what happens after performing the view’s action.
    /// Provide a hint in the form of a brief phrase, like “Purchases the item” or “Downloads the attachment”.
    nonisolated public func accessibilityHint(_ hint: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Communicates to the user what happens after performing the view’s action.
    /// Provide a hint in the form of a brief phrase, like “Purchases the item” or “Downloads the attachment”.
    nonisolated public func accessibilityHint(_ hintKey: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Communicates to the user what happens after performing the view’s action.
    /// Provide a hint in the form of a brief phrase, like “Purchases the item” or “Downloads the attachment”.
    nonisolated public func accessibilityHint<S>(_ hint: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Communicates to the user what happens after performing the view’s action.
    /// Provide a hint in the form of a brief phrase, like “Purchases the item” or “Downloads the attachment”.
    /// - Parameters:
    ///   - hint: The accessibility hint to apply.
    ///   - isEnabled: If true the accessibility hint is applied; otherwise the accessibility hint is unchanged.
    nonisolated public func accessibilityHint(_ hint: Text, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Communicates to the user what happens after performing the view’s action.
    /// Provide a hint in the form of a brief phrase, like “Purchases the item” or “Downloads the attachment”.
    /// - Parameters:
    ///   - hint: The accessibility hint to apply.
    ///   - isEnabled: If true the accessibility hint is applied; otherwise the accessibility hint is unchanged.
    nonisolated public func accessibilityHint(_ hintKey: LocalizedStringKey, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier())
    }

    /// Communicates to the user what happens after performing the view’s action.
    /// Provide a hint in the form of a brief phrase, like “Purchases the item” or “Downloads the attachment”.
    /// - Parameters:
    ///   - hint: The accessibility hint to apply.
    ///   - isEnabled: If true the accessibility hint is applied; otherwise the accessibility hint is unchanged.
    nonisolated public func accessibilityHint<S>(_ hint: S, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        modifier(AccessibilityAttachmentModifier())
    }

    // MARK: - Configuring VoiceOver

    /// Raises or lowers the pitch of spoken text.
    /// Use this modifier when you want to change the pitch of spoken text. 
    /// The value indicates how much higher or lower to change the pitch.
    /// - Parameter value: The amount to raise or lower the pitch. Values between -1 and 0 result in a lower pitch while values between 0 and 1 result in a higher pitch. The method clamps values to the range -1 to 1.
    /// - Returns: The modified view.
    nonisolated public func speechAdjustedPitch(_ value: Double) -> some View {
        modifier(EmptyModifier())
    }

    /// Sets whether VoiceOver should always speak all punctuation in the text view.
    /// - Parameter value: A Boolean value that you set to true if VoiceOver should speak all punctuation in the text. Defaults to true.
    /// - Returns: The modified view.
    nonisolated public func speechAlwaysIncludesPunctuation(_ value: Bool = true) -> some View {
        modifier(EmptyModifier())
    }

    /// Controls whether to queue pending announcements behind existing speech rather than interrupting speech in progress.
    /// Use this modifier when you want affect the order in which the accessibility system delivers spoken text. Announcements can occur automatically when the label or value of an accessibility element changes.
    /// - Parameter value: A Boolean value that determines if VoiceOver speaks changes to text immediately or enqueues them behind existing speech. Defaults to true.
    /// - Returns: The modified view.
    nonisolated public func speechAnnouncementsQueued(_ value: Bool = true) -> some View {
        modifier(EmptyModifier())
    }

    /// Sets whether VoiceOver should speak the contents of the text view character by character.
    /// Use this modifier when you want VoiceOver to speak text as individual letters, character by character. This is important for text that is not meant to be spoken together, like:
    /// * An acronym that isn’t a word, like APPL, spoken as “A-P-P-L”.
    /// * A number representing a series of digits, like 25, spoken as “two-five” rather than “twenty-five”.
    /// - Parameter value: A Boolean value that when true indicates VoiceOver should speak text as individual characters. Defaults to true.
    /// - Returns: The modified view.
    nonisolated public func speechSpellsOutCharacters(_ value: Bool = true) -> some View {
        modifier(EmptyModifier())
    }
}