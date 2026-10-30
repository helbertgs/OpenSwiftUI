//
// GraphicsContext+ResolvedShading.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 28, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

extension GraphicsContext {
    enum ResolvedShading : Equatable, Hashable, Sendable {
        // case tiledImage(GraphicsImage, Point3D, Rect3D, Double)
        // case meshGradient(MeshGradient._Paint, Rect3D)
        case color(Color.Resolved)
        // case style(_ShapeStyle_Pack.Style)
        case levels([GraphicsContext.ResolvedShading])
        case shader(Shader.ResolvedShader, Rect3D)
        case backdrop(Color.Resolved)
        // case gradient(ResolvedGradient, GraphicsContext.GradientGeometry, GraphicsContext.GradientOptions)
    }
}
