import Foundation

/// The implicit context that holds the currently active graph and tracker.
///
/// In Apple's AttributeGraph the graph is reached through an implicit
/// thread-local mechanism, so no view code carries an explicit graph reference.
/// Here `@TaskLocal` is used because every `@MainActor` execution runs on the
/// same cooperative executor; `@TaskLocal` propagates automatically through the
/// Swift execution context without being passed manually. Every call to
/// `_makeView`, `rule {}`, and `input()` must occur inside `withGraph`.
@MainActor
final class _GraphContext {

    /// The graph active in the current task-local execution context.
    @TaskLocal static var current: AttributeGraph?

    /// Creates the context. Private because the type is only used through its static members.
    private init() {}

    /// Executes `body` with `graph` installed as the active context.
    static func withGraph<R>(_ graph: AttributeGraph, _ body: () throws -> R) rethrows -> R {
        try $current.withValue(graph, operation: body)
    }

    /// Executes `body` with `tracker` installed as the active tracker.
    static func withTracker<R>(_ tracker: PropertyList.Tracker, _ body: () throws -> R) rethrows -> R {
        try $_currentTrackerStorage.withValue(tracker, operation: body)
    }
}

/// Module-level `TaskLocal` for the active `PropertyList.Tracker`.
///
/// Declared at module scope (not inside a `@MainActor` type) so that
/// `PropertyList.subscript` — which is `nonisolated` because `PropertyList`
/// is `Sendable` — can read it without an actor hop.
@TaskLocal var _currentTrackerStorage: PropertyList.Tracker? = nil