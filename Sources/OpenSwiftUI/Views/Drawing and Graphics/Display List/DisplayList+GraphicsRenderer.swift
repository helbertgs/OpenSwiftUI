//
// DisplayList+GraphicsRenderer.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import OpenSpatial

extension DisplayList {
    struct GraphicsRenderer {
        var placeholderUserInfo: [CodingUserInfoKey : Any]?
        var platformViewMode: PlatformViewMode
        var stableIDs: _DisplayList_StableIdentityMap?

        func renderDisplayList(_ list: DisplayList, at time: Double, in: inout GraphicsContext) {
            fatalError("not implemented yet")
        }

        init(platformViewMode: PlatformViewMode) {
            self.platformViewMode = platformViewMode
        }

        func drawImplicitLayer(in context: inout GraphicsContext, content: (inout GraphicsContext) -> Void) {
            fatalError("not implemented yet")
        }

        func renderPlatformView(_ value: AnyObject?, in context: GraphicsContext, size: Size3D, viewType: Any.Type) {
            fatalError("not implemented yet")
        }

        func render(at time: Double, do: () -> Void) {
            fatalError("not implemented yet")
        }

        func render(item: DisplayList.Item, in: inout GraphicsContext) {
            fatalError("not implemented yet")
        }

        func render(list: DisplayList, in: inout GraphicsContext) {
            fatalError("not implemented yet")
        }
    }
}

extension DisplayList.GraphicsRenderer {
    enum PlatformViewMode : Equatable, Hashable, Sendable {
        case unsupported
        case ignored
        case rendered(Bool)
    }
}
