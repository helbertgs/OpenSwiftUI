//
// AttributeGraph+Edge.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 16, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

extension AttributeGraph {

    /// A directed edge between two `Storage` nodes in the arena.
    ///
    /// An edge from `from` to `to` means "`to` depends on `from`". Because the graph
    /// owns the storages, both endpoints are held `unowned` so an edge never extends
    /// their lifetime.
    final class Edge {

        /// The source node of the edge; the dependency that produces a value.
        unowned var from: Storage

        /// The destination node of the edge; the dependent that consumes the value.
        unowned var to: Storage

        /// Whether `from` produced a new value that `to` has not yet consumed.
        var isPending = false

        /// Creates a directed edge between two storage nodes.
        ///
        /// - Parameters:
        ///   - from: The source node that produces a value.
        ///   - to: The destination node that depends on the source.
        init(from: Storage, to: Storage) {
            self.from = from
            self.to = to
        }
    }
}
