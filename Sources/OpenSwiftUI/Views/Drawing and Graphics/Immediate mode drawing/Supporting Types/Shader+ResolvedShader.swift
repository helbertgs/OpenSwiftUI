//
// Shader+ResolvedShader.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 28, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

@preconcurrency 
import OpenGLAD
import OpenSpatial

extension Shader {
    struct ResolvedShader : Codable, Equatable, Hashable, Sendable {

        let maxSampleOffset: Size3D
        let options: [Shader.Option]

        init(maxSampleOffset: Size3D, options: [Shader.Option]) {
            self.maxSampleOffset = maxSampleOffset
            self.options = options
        }

        func draw(path: Path, style: PathDrawingStyle, in: GraphicsContext, bounds: Rect3D?) {
        }
    }
}