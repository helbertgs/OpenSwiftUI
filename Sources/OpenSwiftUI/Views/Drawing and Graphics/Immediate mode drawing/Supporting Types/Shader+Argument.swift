//
// Shader+Argument.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 22, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Shader {
    
    /// A single uniform argument value to a shader function.
    public struct Argument : Equatable, Hashable, Sendable, SendableMetatype {
        
        let storage: Storage
        
        init(storage: Storage) {
            self.storage = storage
        }
        
        /// Returns an argument value representing the GLSL value
        /// `float(x)`.
        public static func float<T>(_ x: T) -> Shader.Argument where T : BinaryFloatingPoint {
            .init(
                storage: .float(Float(x))
            )
        }
        
        /// Returns an argument value representing the GLSL value
        /// `float2(x, y)`.
        public static func float2<T>(_ x: T, _ y: T) -> Shader.Argument where T : BinaryFloatingPoint {
            .init(
                storage: .float2(
                    Float(x),
                    Float(y)
                )
            )
        }
        
        /// Returns an argument value representing the GLSL value
        /// `float3(x, y, z)`.
        public static func float3<T>(_ x: T, _ y: T, _ z: T) -> Shader.Argument where T : BinaryFloatingPoint {
            .init(
                storage: .float3(
                    Float(x),
                    Float(y),
                    Float(z)
                )
            )
        }
        
        /// Returns an argument value representing the GLSL value
        /// `float4(x, y, z, w)`.
        public static func float4<T>(_ x: T, _ y: T, _ z: T, _ w: T) -> Shader.Argument where T : BinaryFloatingPoint {
            .init(
                storage: .float4(
                    Float(x),
                    Float(y),
                    Float(z),
                    Float(w)
                )
            )
        }
        
        /// Returns an argument value representing the GLSL value
        /// `float2(point.x, point.y)`.
        public static func float2(_ point: Point3D) -> Shader.Argument {
            .init(
                storage: .float2(
                    Float(point.x),
                    Float(point.y)
                )
            )
        }
        
        /// Returns an argument value representing the GLSL value
        /// `float2(size.width, size.height)`.
        public static func float2(_ size: Size3D) -> Shader.Argument {
            .init(
                storage: .float2(
                    Float(size.width),
                    Float(size.height)
                )
            )
        }
        
        /// Returns an argument value representing the GLSL value
        /// `float2(vector.dx, vector.dy)`.
        public static func float2(_ vector: Vector3D) -> Shader.Argument {
            .init(
                storage: .float2(Float(vector.x), Float(vector.y))
            )
        }
        
        /// Returns an argument value defined by the provided array of floating point numbers.
        public static func floatArray(_ array: [Float]) -> Shader.Argument {
            .init(storage: .array(array))
        }
        
        /// Returns an argument value representing the bounding rect of
        /// the shape or view that the shader is attached to, as
        /// `float4(x, y, width, height)`. This value is undefined for
        /// shaders that do not have a natural bounding rect (e.g.
        /// filter effects drawn into `GraphicsContext`).
        public static var boundingRect: Shader.Argument {
            .init(storage: .none)
        }
        
        /// Returns an argument value representing `color`. When passed
        /// to a MSL function it will convert to a `flaot4` value, as a
        /// premultiplied color in the target color space.
        public static func color(_ color: Color) -> Shader.Argument {
            .init(storage: .none)
        }
        
        /// Returns an argument value defined by the provided array of color values.
        public static func colorArray(_ array: [Color]) -> Shader.Argument {
            .init(storage: .none)
        }
        
        /// Returns an argument value defined by the provided image.
        public static func image(_ image: Image) -> Shader.Argument {
            .init(storage: .image(image))
        }
    }
}

extension Shader.Argument {
    enum Storage : Equatable, Hashable, Sendable {
        case float(Float)
        case float2(Float, Float)
        case float3(Float, Float, Float)
        case float4(Float, Float, Float, Float)
        case array([Float])
        case image(Image)
        case none
    }
}
