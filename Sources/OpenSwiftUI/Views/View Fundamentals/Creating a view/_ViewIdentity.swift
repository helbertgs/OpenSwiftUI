//
// _ViewIdentity.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

/// A stable identity for a view element in the graph.
///
/// Composed of the view type (`ObjectIdentifier(V.self)`) and the creation
/// position in the graph (the display list attribute's arena index, unique
/// within the arena). This mirrors real SwiftUI, where each node in the view
/// tree has an identity composed of type plus structural position.
public struct _ViewIdentity: Hashable, Sendable {
    
    /// The object identity of the view type.
    public let type: ObjectIdentifier

    /// The arena index of the display list attribute, unique per element.
    public let subgraphIndex: UInt32
}