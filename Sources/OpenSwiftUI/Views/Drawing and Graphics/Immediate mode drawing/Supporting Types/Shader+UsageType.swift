//
// Shader+UsageType.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 22, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Shader {
    
    /// The different ways in which a `Shader` may be used to render.
    public enum UsageType: Equatable, Hashable, Sendable, SendableMetatype {
        
        /// The shader will be used as a color effect.
        case colorEffect
        
        /// The shader will be used as a geometric distortion effect.
        case distortionEffect
        
        /// The shader will be used as a layer effect.
        case layerEffect
        
        /// The shader will be used as a `ShapeStyle` value.
        case shapeStyle
    }
}
