import Foundation

extension PropertyList {

    /// Tracks which `PropertyListKey` types are read during a single rule evaluation.
    ///
    /// The `AttributeGraph` activates a fresh `Tracker` at the start of each
    /// rule's `recompute()` call and reads back the recorded keys afterward.
    /// Those keys are stored on the `AttributeStorage` so that
    /// `flushPendingChanges` can skip dirty propagation to nodes whose tracked
    /// keys don't overlap with the keys that actually changed — fine-grained
    /// invalidation rather than coarse whole-`EnvironmentValues` invalidation.
    final class Tracker: @unchecked Sendable {

        /// The set of key identities read during the tracked evaluation.
        private(set) var recordedKeys: Set<ObjectIdentifier> = []

        init() {}

        /// Called by `PropertyList.subscript` getter to record that key `id` was read.
        func record(key id: ObjectIdentifier) {
            recordedKeys.insert(id)
        }

        /// Returns true if this tracker recorded at least one of the given keys.
        func intersects(_ keys: Set<ObjectIdentifier>) -> Bool {
            !recordedKeys.isDisjoint(with: keys)
        }
    }
}