//
// GraphHost.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 19, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

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
        children.forEach { $0.mount() }
    }

    func unmount() {
        children.forEach { $0.unmount() }
    }

    func update() {
        children.forEach { $0.update() }
    }

    func processEvents() {
        children.forEach { $0.processEvents() }
    }

    func render() {
        children.forEach { $0.render() }
    }

    func swapBuffers() {
        children.forEach { $0.swapBuffers() }
    }
}