//
// WindowPlacement.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import OpenSpatial

/// A type which represents a preferred size and position for a window.
///
/// When using the ``Scene.defaultWindowPlacement(_:)`` modifier, you return an
/// instance of a `WindowPlacement` in the closure you provide.
///
/// When constructing a window placement, many initial parameters are optional.
/// Any value not specified will fall back to the scene's default behavior and
/// configuration for sizing and positioning it's windows.
///
/// For example, you can use this to position a window 140 points from the
/// bottom of the visible area of the screen:
///
///     Window("Status", id: "status") {
///         StatusView()
///     }
///     .windowResizability(.contentSize)
///     .defaultWindowPlacement { content, context in
///         let displayBounds = context.defaultDisplay.visibleRect
///         let size = content.sizeThatFits(.unspecified)
///         let position = CGPoint(
///             x: displayBounds.midX - (size.width / 2),
///             y: displayBounds.maxY - size.height - 140)
///         return WindowPlacement(position: position, size: size)
///     }
///
@available(Windows 10, *)
public struct WindowPlacement : Equatable  {

    // MARK: - Checking characteristics

    // The position of the window placement.
    package let position: Point3D

    // The size of the window placement.
    package let size: Size3D

    // MARK: - Creating a WindowPlacement

    /// Creates a new window placement with an absolute position and
    /// optional size.
    ///
    /// Any values not provided will use use the default values for the `Scene`
    /// that this placement is being applied to.
    public init(_ position: Point3D? = nil, size: Size3D? = nil) {
        self.position = position ?? .zero
        self.size = size ?? .zero
    }

    /// Creates a new window placement with an optional position and size.
    ///
    /// Any values not provided will use use the default values for the `Scene`
    /// that this placement is being applied to.
    public init(x: Double? = nil, y: Double? = nil, z: Double? = nil, width: Double? = nil, height: Double? = nil, depth: Double? = nil) {
        self.position = Point3D(x: x ?? 0, y: y ?? 0, z: z ?? 0)
        self.size = Size3D(width: width ?? 0, height: height ?? 0, depth: depth ?? 0)
    }

    /// Creates a new window placement with a display-relative position, with
    /// an optional size.
    ///
    /// Any values not provided will use use the default values for the `Scene`
    /// that this placement is being applied to.
    public init(_ position: UnitPoint, size: Size3D? = nil) {
        self.position = Point3D(x: position.x, y: position.y)
        self.size = size ?? .zero
    }

    /// Creates a new window placement with a display-relative position, with
    /// an optional width and height.
    ///
    /// Any values not provided will use use the default values for the `Scene`
    /// that this placement is being applied to.
    public init(_ position: UnitPoint, width: Double? = nil, height: Double? = nil, depth: Double? = nil) {
        self.position = Point3D(x: position.x, y: position.y)
        self.size = Size3D(width: width ?? 0, height: height ?? 0, depth: depth ?? 0)
    }
}