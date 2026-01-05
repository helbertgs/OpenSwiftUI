//
// DisplayProxy.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import OpenSpatial

// A type which provides information about display hardware.
///
/// You can use this type with your custom window layouts to size and position
/// windows relative to a display's bounds.
///
/// For example, your custom window layout can position a window 140 points from
/// the bottom of the screen's visible area:
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
@available(Windows 11, *)
public struct DisplayProxy : Equatable {

    /// The full dimensions of the display, including any space occupied by
    /// system interface elements.
    public let bounds: Rect3D

    /// The safe area inset of this display.
    ///
    /// On macOS, the safe area contains space occupied by the dock and
    /// menu bar, and is dependent on the current user settings. Additionally,
    /// on Macs that include a camera housing in the bezel, the safe area
    /// contains the vertical space occupied by the bezel.
    public let safeAreaInsets: EdgeInsets

    /// The portion of the display where it is safe to place windows.
    ///
    /// On macOS, this area does not contain the space occupied by the dock and
    /// menu bar. Additionally, on Macs that include a camera housing in the
    /// bezel this rectangle does not include the bezel or visible areas to
    /// each side of the bezel.
    public let visibleRect: Rect3D

    /// Creates a display proxy with the given properties.
    /// 
    /// - Parameters:
    ///   - bounds: The full dimensions of the display, including any space occupied by system interface elements.
    ///   - safeAreaInsets: The safe area inset of this display.
    ///   - visibleRect: The portion of the display where it is safe to place windows.
    package init(bounds: Rect3D, safeAreaInsets: EdgeInsets, visibleRect: Rect3D) {
        self.bounds = bounds
        self.safeAreaInsets = safeAreaInsets
        self.visibleRect = visibleRect
    }
}