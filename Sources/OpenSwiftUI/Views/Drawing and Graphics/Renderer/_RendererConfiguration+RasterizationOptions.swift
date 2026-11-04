//
// _RendererConfiguration+RasterizationOptions.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

extension _RendererConfiguration {
    struct RasterizationOptions {
        var colorMode: ColorRenderingMode = .linear
        var drawsPlatformViews: Bool = false
        var isOpaque: Bool = false
        var maxDrawableCount: Int = 0
        var prefersDisplayCompositing: Bool = false
        var rendersAsynchronously: Bool = false
    }
}
