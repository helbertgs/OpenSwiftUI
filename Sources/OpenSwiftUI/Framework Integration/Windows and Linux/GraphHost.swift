import Foundation

/// A graph host.
package class GraphHost {

    /// The parent of the graph host.
    package weak var parent: GraphHost? = nil

    /// The children of the graph host.
    package var children: [GraphHost] = []

    @inlinable package func appendChild(_ child: GraphHost) {
        child.parent = self
        children.append(child)
    }

    package func mount() {
    }

    package func unmount() {
    }

    package func update() {
    }
}