import Foundation

/// A graph host.
@MainActor class GraphHost {

    /// The parent of the graph host.
    weak var parent: GraphHost? = nil

    /// The children of the graph host.
    var children: [GraphHost] = []

    func appendChild(_ child: GraphHost) {
        child.parent = self
        children.append(child)
    }

    func mount() {
    }

    func unmount() {
    }

    func update() {
    }
}