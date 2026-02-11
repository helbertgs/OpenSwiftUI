//
// GraphHost.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 19, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// A graph host that manages a node in the runtime graph hierarchy.
///
/// `GraphHost` serves as the base class for `AppGraph`, `SceneGraph`, and `ViewGraph`,
/// providing common functionality for managing parent-child relationships and lifecycle.
@MainActor class GraphHost {

    // MARK: - Hierarchy

    /// The parent of this graph host in the hierarchy.
    weak var parent: GraphHost? = nil

    /// The children of this graph host.
    private(set) var children: [GraphHost] = []

    // MARK: - Lifecycle State

    /// A Boolean value indicating whether this graph host has been mounted.
    private(set) var isMounted: Bool = false

    // MARK: - Child Management

    /// Appends a child to this graph host.
    ///
    /// - Parameter child: The child graph host to append.
    func appendChild(_ child: GraphHost) {
        child.parent = self
        children.append(child)
    }

    /// Removes a child from this graph host.
    ///
    /// - Parameter child: The child graph host to remove.
    func removeChild(_ child: GraphHost) {
        child.parent = nil
        children.removeAll { $0 === child }
    }

    /// Removes all children from this graph host.
    func removeAllChildren() {
        children.forEach { $0.parent = nil }
        children.removeAll()
    }

    /// Inserts a child at the specified index.
    ///
    /// - Parameters:
    ///   - child: The child graph host to insert.
    ///   - index: The index at which to insert the child.
    func insertChild(_ child: GraphHost, at index: Int) {
        child.parent = self
        children.insert(child, at: index)
    }

    // MARK: - Hierarchy Traversal

    /// Finds an ancestor of the specified type.
    ///
    /// - Parameter type: The type of ancestor to find.
    /// - Returns: The first ancestor of the specified type, or `nil` if not found.
    func findAncestor<T: GraphHost>(ofType type: T.Type) -> T? {
        if let typedParent = parent as? T {
            return typedParent
        }
        return parent?.findAncestor(ofType: type)
    }

    /// Finds all descendants of the specified type.
    ///
    /// - Parameter type: The type of descendants to find.
    /// - Returns: An array of all descendants of the specified type.
    func findDescendants<T: GraphHost>(ofType type: T.Type) -> [T] {
        var result: [T] = []
        for child in children {
            if let typedChild = child as? T {
                result.append(typedChild)
            }
            result.append(contentsOf: child.findDescendants(ofType: type))
        }
        return result
    }

    /// Finds the first descendant of the specified type.
    ///
    /// - Parameter type: The type of descendant to find.
    /// - Returns: The first descendant of the specified type, or `nil` if not found.
    func findFirstDescendant<T: GraphHost>(ofType type: T.Type) -> T? {
        for child in children {
            if let typedChild = child as? T {
                return typedChild
            }
            if let found = child.findFirstDescendant(ofType: type) {
                return found
            }
        }
        return nil
    }

    /// Returns the root of the graph hierarchy.
    var root: GraphHost {
        parent?.root ?? self
    }

    // MARK: - Lifecycle

    /// Mounts this graph host and its children.
    ///
    /// Override this method to perform custom mounting logic.
    /// Always call `super.mount()` to ensure children are mounted.
    func mount() {
        guard !isMounted else { return }
        isMounted = true
        children.forEach { $0.mount() }
    }

    /// Unmounts this graph host and its children.
    ///
    /// Override this method to perform custom cleanup logic.
    /// Always call `super.unmount()` to ensure children are unmounted.
    func unmount() {
        guard isMounted else { return }
        children.forEach { $0.unmount() }
        isMounted = false
    }

    // MARK: - Update Cycle

    /// Updates this graph host and its children.
    func update() {
        children.forEach { $0.update() }
    }

    /// Processes events for this graph host and its children.
    func processEvents() {
        children.forEach { $0.processEvents() }
    }

    /// Renders this graph host and its children.
    func render() {
        children.forEach { $0.render() }
    }

    /// Swaps buffers for this graph host and its children.
    func swapBuffers() {
        children.forEach { $0.swapBuffers() }
    }

    func pollEvents() {
        // children.forEach { $0.pollEvents() }
    }

    func clear() {
        children.forEach { $0.clear() }
    }

    // MARK: - Debugging

    /// Returns a string representation of the graph hierarchy for debugging.
    func debugHierarchy(indent: Int = 0) -> String {
        let indentation = String(repeating: "  ", count: indent)
        var result = "\(indentation)\(type(of: self))"
        if !children.isEmpty {
            result += " {\n"
            for child in children {
                result += child.debugHierarchy(indent: indent + 1) + "\n"
            }
            result += "\(indentation)}"
        }
        return result
    }
}
