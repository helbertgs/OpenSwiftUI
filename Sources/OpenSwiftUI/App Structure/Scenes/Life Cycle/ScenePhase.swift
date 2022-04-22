import Swift

/// An indication of a scene's operational state.
///
/// The system moves your app's ``Scene`` instances through phases that reflect
/// a scene's operational state. You can trigger actions when the phase changes.
/// Read the current phase by observing the ``EnvironmentValues/scenePhase``
/// value in the ``Environment``:
///
///     @Environment(\.scenePhase) private var scenePhase
///
/// How you interpret the value depends on where it's read from.
/// If you read the phase from inside a ``View`` instance, you obtain a value
/// that reflects the phase of the scene that contains the view. The following
/// example uses the ``OpenSwiftUI/View/onChange(of:perform:)`` method to enable
/// a timer whenever the enclosing scene enters the ``ScenePhase/active`` phase
/// and disable the timer when entering any other phase:
///
///     struct MyView: View {
///         @ObservedObject var model: DataModel
///         @Environment(\.scenePhase) private var scenePhase
///
///         var body: some View {
///             TimerView()
///                 .onChange(of: scenePhase) { phase in
///                     model.isTimerRunning = (phase == .active)
///                 }
///         }
///     }
///
/// If you read the phase from within an ``App`` instance, you obtain an
/// aggregate value that reflects the phases of all the scenes in your app. The
/// app reports a value of ``ScenePhase/active`` if any scene is active, or a
/// value of ``ScenePhase/inactive`` when no scenes are active. This includes
/// multiple scene instances created from a single scene declaration; for
/// example, from a ``WindowGroup``. When an app enters the
/// ``ScenePhase/background`` phase, expect the app to terminate soon after.
/// You can use that opportunity to free any resources:
///
///     @main
///     struct MyApp: App {
///         @Environment(\.scenePhase) private var scenePhase
///
///         var body: some Scene {
///             WindowGroup {
///                 MyRootView()
///             }
///             .onChange(of: scenePhase) { phase in
///                 if phase == .background {
///                     // Perform cleanup when all scenes within
///                     // MyApp go to the background.
///                 }
///             }
///         }
///     }
///
/// If you read the phase from within a custom ``Scene`` instance, the value
/// similarly reflects an aggregation of all the scenes that make up the custom
/// scene:
///
///     struct MyScene: Scene {
///         @Environment(\.scenePhase) private var scenePhase
///
///         var body: some Scene {
///             WindowGroup {
///                 MyRootView()
///             }
///             .onChange(of: scenePhase) { phase in
///                 if phase == .background {
///                     // Perform cleanup when all scenes within
///                     // MyScene go to the background.
///                 }
///             }
///         }
///     }
@frozen public enum ScenePhase : Comparable, Equatable, Hashable {

    // MARK: - Case(s).

    /// The scene is in the foreground and interactive.
    ///
    /// An active scene isn't necessarily front-most. For example, a macOS
    /// window might be active even if it doesn't currently have focus.
    /// Nevertheless, all scenes should operate normally in this phase.
    ///
    /// An app or custom scene in this phase contains at least one active scene
    /// instance.
    case active

    /// The scene is in the foreground but should pause its work.
    ///
    /// A scene in this phase doesn't receive events and should pause
    /// timers and free any unnecessary resources. The scene might be completely
    /// hidden in the user interface or otherwise unavailable to the user.
    /// In macOS, scenes only pass through this phase temporarily on their way
    /// to the ``ScenePhase/background`` phase.
    ///
    /// An app or custom scene in this phase contains no scene instances in the
    /// ``ScenePhase/active`` phase.
    case inactive

    /// The scene isn't currently visible in the UI.
    ///
    /// Do as little as possible in a scene that's in the `background` phase.
    /// The `background` phase can precede termination, so do any cleanup work
    /// immediately upon entering this state. For example, close any open files
    /// and network connections. However, a scene can also return to the
    /// ``ScenePhase/active`` phase from the background.
    ///
    /// Expect an app that enters the `background` phase to terminate.
    case background
}
