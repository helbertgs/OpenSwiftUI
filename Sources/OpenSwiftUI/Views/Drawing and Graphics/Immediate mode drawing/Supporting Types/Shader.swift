//
// Shader.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 22, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A reference to a function in a Metal shader library, along with its
/// bound uniform argument values.
///
/// Shader values can be used as filter effects on views, see the
/// ``View/colorEffect(_:isEnabled:)``,
/// ``View/distortionEffect(_:maxSampleOffset:isEnabled:)``,
/// and ``View/layerEffect(_:maxSampleOffset:isEnabled:)`` functions.
///
/// Shaders also conform to the ``ShapeStyle`` protocol, letting their
/// GLSL shader function provide per-pixel color to fill any shape or
/// text view. For a shader function to act as a fill pattern it must
/// have a function signature matching:
///
///     floa4 name(float2 position, args...)
///
/// where `position` is the user-space coordinates of the pixel applied
/// to the shader, and `args...` should be compatible with the uniform
/// arguments bound to `shader`. The function should return the
/// premultiplied color value in the color space of the destination
/// (typically extended sRGB).
///
public struct Shader : Equatable, Hashable, Sendable {
    
    var _variant: UInt32 = 0
    
    var options: Option = .init(rawValue: 0)
    
    /// The shader function called by the shader.
    public var function: ShaderFunction

    /// The uniform argument values passed to the shader function.
    public var arguments: [Shader.Argument]

    /// For shader functions that return color values, whether the
    /// returned color has dither noise added to it, or is simply
    /// rounded to the output bit-depth. For shaders generating smooth
    /// gradients, dithering is usually necessary to prevent visible
    /// banding in the result.
    public var dithersColor: Bool {
        options.contains(.dithersColor)
    }

    /// Creates a new shader from a function and the uniform argument
    /// values to bind to the function.
    public init(function: ShaderFunction, arguments: [Shader.Argument]) {
        self.function = function
        self.arguments = arguments
    }
}

extension Shader {

    /// Attempts to asynchronously compile a shader function, to
    /// minimize the chance of stalling when it is first used for
    /// rendering.
    ///
    /// Before being available for rendering each shader must be
    /// compiled for the current GPU. By default this happens on first
    /// use, but that may cause that frame to be delayed waiting for
    /// the compiler, i.e. cause a visible "glitch" in animations.
    ///
    /// Calling this method for each shader before it's first used
    /// allows the necessary compilation to happen ahead of time,
    /// eliminating the delay on the first actual use (provided
    /// `compile()` completes before the first use of the shader).
    ///
    /// For compilation to be successful the specified usage type must
    /// match how the shader is eventually used to render, and its
    /// current argument values must match the types of the arguments
    /// used when rendering (however array and data sizes may be
    /// empty).
    ///
    /// For example, to compile a fill shader asynchronously when your
    /// app launches:
    ///
    ///     Task {
    ///         let shader = ShaderLibrary.example(.color(.clear), .float(0))
    ///         try! await shader.compile(as: .shapeStyle)
    ///     }
    ///
    /// Here the MSL shader function `example` takes two uniform
    /// arguments: a color and a numeric value. The placeholder values
    /// are replaced with actual values when using the shader, in this
    /// case to fill a circle:
    ///
    ///     Circle().fill(
    ///         ShaderLibrary.example(.color(.orange), .float(32)))
    ///
    /// - Parameter type: how the shader will eventually be used.
    ///
    /// - Throws: an error describing why compilation failed.
    func compile(as: UsageType) async throws {
    }
}
