//
// WindowLayoutRoot.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import OpenSpatial

/// A proxy which represents the root contents of a window.
/// 
/// This type acts like a proxy for the contents of the window defined by a OpenSwiftUI Scene. 
/// The ``Scene.defaultWindowPlacement(_:)`` modifier receives an instance of this type, representing the contents of the window being created.
/// 
/// Use this proxy to get information about the window’s contents, like it’s size.
@available(Windows 10, *)
public struct WindowLayoutRoot {

    // MARK: - Instance Methods

    /// Asks the window’s content for its size.
    /// 
    /// - Parameter proposal: A proposed size for the subview. In OpenSwiftUI, views choose their own size, but can take a size proposal from their parent view into account when doing so.
    /// - Returns: The size that the content chooses for itself, given the proposal from its container view.
    public func sizeThatFits(_ proposal: ProposedViewSize) -> Size3D {
        .zero
    }
}