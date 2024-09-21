import Foundation

extension View {

    // MARK: - Adding actions to views

    /// Adds an accessibility action to the view. Actions allow assistive technologies,
    /// such as the VoiceOver, to interact with the view by invoking the action.
    ///
    /// For example, this is how a `.default` action to compose
    /// a new email could be added to a view.
    ///
    ///     var body: some View {
    ///         ContentView()
    ///             .accessibilityAction {
    ///                 // Handle action
    ///             }
    ///     }
    ///
    nonisolated public func accessibilityAction(_ actionKind: AccessibilityActionKind = .default,_ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier(
            storage: .init(value: .init(
                properties: .init(
                    storage: [
                            ObjectIdentifier(AnyAccessibilityAction.self): 
                            AccessibilityPropertiesEntry<Array<AnyAccessibilityAction>>(typedValue: [
                                AccessibilityActionStorage(
                                    action: AccessibilityVoidAction(kind: actionKind),
                                    category: nil, 
                                    label: nil, 
                                    image: nil, 
                                    handler: handler, 
                                    seed: 0
                                )
                            ])
                        ]
                ),
                platformElement: nil
            )),
            behavior: nil
        ))
    }

    /// Adds an accessibility action to the view. Actions allow assistive technologies,
    /// such as the VoiceOver, to interact with the view by invoking the action.
    ///
    /// For example, this is how a custom action to compose
    /// a new email could be added to a view.
    ///
    ///     var body: some View {
    ///         ContentView()
    ///             .accessibilityAction(named: Text("New Message")) {
    ///                 // Handle action
    ///             }
    ///     }
    ///
    nonisolated public func accessibilityAction(named name: Text, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier(
            storage: .init(value: .init(
                properties: .init(
                    storage: [
                            ObjectIdentifier(AnyAccessibilityAction.self): 
                            AccessibilityPropertiesEntry<Array<AnyAccessibilityAction>>(typedValue: [
                                AccessibilityActionStorage(
                                    action: AccessibilityVoidAction(kind: .init(named: name)),
                                    category: nil, 
                                    label: nil, 
                                    image: nil, 
                                    handler: handler, 
                                    seed: 0
                                )
                            ])
                        ]
                ),
                platformElement: nil
            )),
            behavior: nil
        ))
    }

    /// Adds an accessibility action to the view. Actions allow assistive technologies,
    /// such as the VoiceOver, to interact with the view by invoking the action.
    ///
    /// For example, this is how a custom action to compose
    /// a new email could be added to a view.
    ///
    ///     var body: some View {
    ///         ContentView()
    ///             .accessibilityAction {
    ///                 // Handle action
    ///             } label: {
    ///                 Label("New Message", systemImage: "plus")
    ///             }
    ///     }
    ///
    nonisolated public func accessibilityAction<Label>(action: @escaping () -> Void, @ViewBuilder label: () -> Label) -> some View where Label : View {
        fatalError()
    }

    /// Adds multiple accessibility actions to the view.
    /// - Returns: The modified view.
    nonisolated public func accessibilityActions<Content>(@ViewBuilder _ content: () -> Content) -> some View where Content : View {
        fatalError()
    }

    /// Adds an accessibility adjustable action to the view. Actions allow assistive technologies, such as the VoiceOver, to interact with the view by invoking the action.
    nonisolated public func accessibilityAdjustableAction(_ handler: @escaping (AccessibilityAdjustmentDirection) -> AccessibilityActionResult) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier(
            storage: .init(value: .init(
                properties: .init(
                    storage: [
                            ObjectIdentifier(AnyAccessibilityAction.self): 
                            AccessibilityPropertiesEntry<Array<AnyAccessibilityAction>>(typedValue: [
                                AccessibilityActionStorage(
                                    action: AccessibilityAdjustableAction(continuous: nil),
                                    category: nil, 
                                    label: nil, 
                                    image: nil, 
                                    handler: handler, 
                                    seed: 0
                                )
                            ])
                        ]
                ),
                platformElement: nil
            )),
            behavior: nil
        ))
    }

    /// Adds an accessibility scroll action to the view. Actions allow assistive technologies, such as the VoiceOver, to interact with the view by invoking the action.
    nonisolated public func accessibilityScrollAction(_ handler: @escaping (Edge) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        modifier(AccessibilityAttachmentModifier(
            storage: .init(value: .init(
                properties: .init(
                    storage: [
                            ObjectIdentifier(AnyAccessibilityAction.self): 
                            AccessibilityPropertiesEntry<Array<AnyAccessibilityAction>>(typedValue: [
                                AccessibilityActionStorage(
                                    action: AccessibilityScrollAction(),
                                    category: nil, 
                                    label: nil, 
                                    image: nil, 
                                    handler: handler, 
                                    seed: 0
                                )
                            ])
                        ]
                ),
                platformElement: nil
            )),
            behavior: nil
        ))
    }

    /// Adds multiple accessibility actions to the view with a specific category. Actions allow assistive technologies, such as VoiceOver, to interact with the view by invoking the action and are grouped by their category. 
    /// When multiple action modifiers with an equal category are applied to the view, the actions are combined together.
    /// - Parameters:
    ///   - category: The category the accessibility actions are grouped by.
    ///   - content: The accessibility actions added to the view.
    /// - Returns: The modified view.
    nonisolated public func accessibilityActions<Content>(category: AccessibilityActionCategory, @ViewBuilder _ content: () -> Content) -> some View where Content : View {
        fatalError()
    }

    // MARK - Offering Quick Actions to people

    /// Adds a quick action to be shown by the system when active.
    /// - Returns: The modified view.
    nonisolated public func accessibilityQuickAction<Style, Content>(style: Style, @ViewBuilder content: () -> Content) -> some View where Style : AccessibilityQuickActionStyle, Content : View {
        fatalError()
    }

    /// Adds a quick action to be shown by the system when active.
    /// - Returns: The modified view.
    nonisolated public func accessibilityQuickAction<Style, Content>(style: Style, isActive: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View where Style : AccessibilityQuickActionStyle, Content : View {
        fatalError()
    }

    // MARK: - Making gestures accessible

    /// The activation point for an element is the location assistive technologies use to initiate gestures.
    /// 
    /// Use this modifier to ensure that the activation point for a small element remains accurate even if you present a larger version of the element to VoiceOver.
    /// If an activation point is not provided, an activation point will be derrived from one of the accessibility elements decendents or from the center of the accessibility frame.
    nonisolated public func accessibilityActivationPoint(_ activationPoint: Point) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The activation point for an element is the location assistive technologies use to initiate gestures.
    /// 
    /// Use this modifier to ensure that the activation point for a small element remains accurate even if you present a larger version of the element to VoiceOver.
    /// If an activation point is not provided, an activation point will be derived from one of the accessibility elements decedents or from the center of the accessibility frame.
    /// - Parameters:
    ///   - activationPoint: The accessibility activation point to apply.
    ///   - isEnabled: If true the accessibility activation point is applied; otherwise the accessibility activation point is unchanged.
    nonisolated public func accessibilityActivationPoint(_ activationPoint: Point, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The point an assistive technology should use to begin a drag interaction.
    nonisolated public func accessibilityDragPoint(_ point: UnitPoint,description: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The point an assistive technology should use to begin a drag interaction.
    nonisolated public func accessibilityDragPoint(_ point: UnitPoint, description: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The point an assistive technology should use to begin a drag interaction.
    nonisolated public func accessibilityDragPoint<S>(_ point: UnitPoint, description: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        fatalError()
    }

    /// The point an assistive technology should use to begin a drag interaction.
    /// - Parameters:
    ///   - point: The point the assitive technology will begin a drag interaction.
    ///   - description: The description of the drag interaction.
    ///   - isEnabled: If true the accessibility drag point is applied; otherwise the accessibility drag point is unchanged.
    nonisolated public func accessibilityDragPoint(_ point: UnitPoint, description: LocalizedStringKey, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The point an assistive technology should use to begin a drag interaction.
    /// - Parameters:
    ///   - point: The point the assitive technology will begin a drag interaction.
    ///   - description: The description of the drag interaction.
    ///   - isEnabled: If true the accessibility drag point is applied; otherwise the accessibility drag point is unchanged.
    nonisolated public func accessibilityDragPoint(_ point: UnitPoint, description: Text, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The point an assistive technology should use to begin a drag interaction.
    /// - Parameters:
    ///   - point: The point the assitive technology will begin a drag interaction.
    ///   - description: The description of the drag interaction.
    ///   - isEnabled: If true the accessibility drag point is applied; otherwise the accessibility drag point is unchanged.
    nonisolated public func accessibilityDragPoint<S>(_ point: UnitPoint, description: S, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        fatalError()
    }

    /// The point an assistive technology should use to end a drag interaction.
    nonisolated public func accessibilityDropPoint(_ point: UnitPoint, description: LocalizedStringKey) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The point an assistive technology should use to end a drag interaction.
    nonisolated public func accessibilityDropPoint(_ point: UnitPoint, description: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The point an assistive technology should use to end a drag interaction.
    nonisolated public func accessibilityDropPoint<S>(_ point: UnitPoint, description: S) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        fatalError()
    }

    /// The point an assistive technology should use to end a drag interaction.
    nonisolated public func accessibilityDropPoint(_ point: UnitPoint, description: LocalizedStringKey, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The point an assistive technology should use to end a drag interaction.
    nonisolated public func accessibilityDropPoint(_ point: UnitPoint, description: Text, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// The point an assistive technology should use to end a drag interaction.
    nonisolated public func accessibilityDropPoint<S>(_ point: UnitPoint, description: S, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol {
        fatalError()
    }

    /// Explicitly set whether this accessibility element is a direct touch area. Direct touch areas passthrough touch events to the app rather than being handled through an assistive technology, such as VoiceOver. 
    /// The modifier accepts an optional AccessibilityDirectTouchOptions option set to customize the functionality of the direct touch area.
    nonisolated public func accessibilityDirectTouch(_ isDirectTouchArea: Bool = true, options: AccessibilityDirectTouchOptions = []) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// Adds an accessibility zoom action to the view. Actions allow assistive technologies, such as VoiceOver, to interact with the view by invoking the action.
    nonisolated public func accessibilityZoomAction(_ handler: @escaping (AccessibilityZoomGestureAction) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    // MARK: - Controlling focus

    /// Modifies this view by binding its accessibility element’s focus state to the given boolean state value.
    /// - Parameter condition: The accessibility focus state to bind. When accessibility focus moves to the accessibility element of the modified view, the focus value is set to true. 
    /// If the value is set to true programmatically, then accessibility focus will move to accessibility element of the modified view. 
    /// The value will be set to false if accessibility focus leaves the accessibility element of the modified view, and accessibility focus will be dismissed automatically if the value is set to false programmatically.
    /// - Returns: The modified view.
    nonisolated public func accessibilityFocused(_ condition: AccessibilityFocusState<Bool>) -> some View {
        fatalError()
    }

    /// Modifies this view by binding its accessibility element’s focus state to the given state value.
    /// - Parameters:
    ///   - binding: The state binding to register. When accessibility focus moves to the accessibility element of the modified view, OpenSwiftUI sets the bound value to the corresponding match value. 
    /// If you set the state value programmatically to the matching value, then accessibility focus moves to the accessibility element of the modified view. 
    /// OpenSwiftUI sets the value to nil if accessibility focus leaves the accessibility element associated with the modified view, and programmatically setting the value to nil dismisses focus automatically.
    ///   - value: The value to match against when determining whether the binding should change.
    /// - Returns: The modified view.
    nonisolated public func accessibilityFocused<Value>(_ binding: AccessibilityFocusState<Value>, equals value: Value) -> some View where Value : Hashable {
        fatalError()
    }

    // MARK: - Managing interactivity

    /// Explicitly set whether this Accessibility element responds to user interaction and would thus be interacted with by technologies such as Switch Control, Voice Control or Full Keyboard Access.
    /// If this is not set, the value is inferred from the traits of the Accessibility element, the presence of Accessibility actions on the element, or the presence of gestures on the element or containing views.
    nonisolated public func accessibilityRespondsToUserInteraction(_ respondsToUserInteraction: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }

    /// Explicitly set whether this Accessibility element responds to user interaction and would thus be interacted with by technologies such as Switch Control, Voice Control or Full Keyboard Access.
    /// If this is not set, the value is inferred from the traits of the Accessibility element, the presence of Accessibility actions on the element, or the presence of gestures on the element or containing views.
    /// - Parameters:
    ///   - respondsToUserInteraction: Whether the view responds to user interaction.
    ///   - isEnabled: If true the accessibility interaction state is applied; otherwise the accessibility interaction state is unchanged.
    nonisolated public func accessibilityRespondsToUserInteraction(_ respondsToUserInteraction: Bool, isEnabled: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier> {
        fatalError()
    }
}