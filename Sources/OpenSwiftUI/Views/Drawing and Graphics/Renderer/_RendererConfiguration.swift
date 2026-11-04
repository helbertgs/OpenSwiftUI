//
// _DisplayList_AnyEffectAnimation.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

struct _RendererConfiguration {
    let contentsScale: Double? = nil
    let minFrameInterval: Double = 0
    let renderer: _RendererConfiguration.Renderer

    static func rasterized(_ options: _RendererConfiguration.RasterizationOptions) -> _RendererConfiguration {
        fatalError("not implemented yet")
    }

    public init(renderer: _RendererConfiguration.Renderer) {
        self.renderer = renderer
    }
}
