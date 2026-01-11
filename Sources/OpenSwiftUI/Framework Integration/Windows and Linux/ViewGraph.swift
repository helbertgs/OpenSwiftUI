import Foundation

/// A graph host for a view.
package final class ViewGraph : GraphHost {

    /// The last built outputs snapshot.
    package private(set) var outputs: _ViewOutputs

    /// Whether this view graph needs to be re-built/re-rendered.
    package var isDirty: Bool = true

    package init(outputs: _ViewOutputs) {
        self.outputs = outputs
    }

    package func markDirty() {
        isDirty = true
    }

    package func clearDirty() {
        isDirty = false
    }

    package func updateOutputs(_ newOutputs: _ViewOutputs) {
        outputs = newOutputs
        markDirty()
    }
}