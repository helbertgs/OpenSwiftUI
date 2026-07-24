//
// _GestureInputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import OpenSpatial

/// The bridge between the view tree (which declares gestures during `_makeView`)
/// and the `Application` (which dispatches GLFW input events).
///
/// In real SwiftUI, gestures are not registered directly with the run loop —
/// they flow through the graph via `_GestureInputs`/`_GestureOutputs`. A view
/// registers handlers with the `GestureHandler` provided by `_ViewInputs`, and
/// the `Application` consults those handlers when processing input events.
/// Using a reference type lets views register during `_makeView` without having
/// to return the handlers in their `_ViewOutputs`.
@MainActor
final class GestureHandler {

    /// A registered tap gesture, pairing a reactive frame with its handler.
    ///
    /// The frame is a reactive `_GraphValue`, so if the layout changes the
    /// hit-test automatically uses the updated frame without re-registering.
    struct TapRegistration {

        /// The reactive frame used for hit-testing the tap.
        let frame: _GraphValue<Rect3D>

        /// The handler invoked when the tap hits the frame.
        let handler: Attribute<@MainActor () -> Void>
    }

    /// A registered hover gesture, tracking whether the cursor is inside its frame.
    struct HoverRegistration {

        /// The reactive frame used for hit-testing the hover.
        let frame: _GraphValue<Rect3D>

        /// The handler invoked with the new inside/outside state.
        let handler: Attribute<@MainActor (Bool) -> Void>

        /// Whether the cursor is currently inside the frame.
        var isInside: Bool = false
    }

    /// The registered tap gestures.
    private(set) var tapRegistrations:   [TapRegistration]   = []

    /// The registered hover gestures.
    private(set) var hoverRegistrations: [HoverRegistration] = []

    /// Creates an empty gesture handler.
    init() {}

    /// Registers a tap gesture.
    /// - Parameters:
    ///   - frame: The reactive frame to hit-test against.
    ///   - handler: The handler invoked when the frame is tapped.
    func registerTap(frame: _GraphValue<Rect3D>, handler: Attribute<@MainActor () -> Void>) {
        tapRegistrations.append(TapRegistration(frame: frame, handler: handler))
    }

    /// Registers a hover gesture.
    /// - Parameters:
    ///   - frame: The reactive frame to hit-test against.
    ///   - handler: The handler invoked when the cursor enters or leaves the frame.
    func registerHover(frame: _GraphValue<Rect3D>, handler: Attribute<@MainActor (Bool) -> Void>) {
        hoverRegistrations.append(HoverRegistration(frame: frame, handler: handler))
    }

    /// Dispatches a tap at the given point to all matching registrations.
    /// - Parameter point: The point of the tap, in view coordinates.
    func handleTap(at point: Point3D) {
        for reg in tapRegistrations where reg.frame.wrappedValue.contains(point) {
            reg.handler.wrappedValue()
        }
    }

    /// Dispatches a cursor move, firing hover handlers whose inside state changed.
    /// - Parameter point: The new cursor position, in view coordinates.
    func handleHoverMove(to point: Point3D) {
        for i in hoverRegistrations.indices {
            let isInside  = hoverRegistrations[i].frame.wrappedValue.contains(point)
            let wasInside = hoverRegistrations[i].isInside
            if isInside != wasInside {
                hoverRegistrations[i].isInside = isInside
                hoverRegistrations[i].handler.wrappedValue(isInside)
            }
        }
    }

    /// Handles the cursor leaving the window, resetting any hovered registrations.
    ///
    /// Ensures any view still marked as `isInside` receives `false` before the
    /// cursor disappears.
    func handleCursorExit() {
        for i in hoverRegistrations.indices where hoverRegistrations[i].isInside {
            hoverRegistrations[i].isInside = false
            hoverRegistrations[i].handler.wrappedValue(false)
        }
    }

    /// Clears all registered gestures.
    func reset() {
        tapRegistrations   = []
        hoverRegistrations = []
    }
}

extension Rect3D {

    /// Determines whether the rectangle contains the given point.
    /// 
    /// - Parameter point: The point to test.
    /// - Returns: `true` if the point lies within the rectangle's bounds.
    func contains(_ point: Point3D) -> Bool {
        point.x >= origin.x && point.x <= origin.x + size.width &&
        point.y >= origin.y && point.y <= origin.y + size.height
    }
}
