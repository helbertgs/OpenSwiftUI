import Swift

@frozen public enum EditMode : CaseIterable, Equatable, Hashable {

    // MARK: - Case(s).

    /// The user can edit the view content.
    case active

    /// The user can't edit the view content.
    case inactive

    /// The view is in a temporary edit mode.
    case transient

    // MARK: - Property(ies).

    /// Indicates wheter a view is being edited.
    var isEditing: Bool {
        switch self {
        case .inactive:
            return false
        default:
            return false
        }
    }
}
