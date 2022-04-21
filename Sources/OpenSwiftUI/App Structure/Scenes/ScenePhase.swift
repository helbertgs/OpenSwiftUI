import Swift

@frozen public enum ScenePhase : Comparable, Equatable, Hashable {

    // MARK: - Case(s).

    /// The scene is in the foreground and interactive.
    case active

    /// The scene is in the foreground but should pause its work.
    case inactive

    /// The scene isn;t currently in the UI.
    case background
}
