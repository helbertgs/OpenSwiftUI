//
// GraphicsContext+GradiantOptions.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension GraphicsContext {

    /// Options that affect the rendering of color gradients.
    /// 
    /// Use these options to affect how OpenSwiftUI manages a gradient that you create for a ``GraphicsContext.Shading`` instance for use in a ``GraphicsContext``.
    @frozen public struct GradientOptions : BitwiseCopyable, Copyable, Equatable, OptionSet, Sendable {

        // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public let rawValue: Int

        // MARK: - Creating a Value

        /// Creates a new instance with the specified raw value.
        /// 
        /// - Parameter rawValue: The raw value to use for the new instance.
        @inlinable public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        // MARK: - Getting gradient options

        /// An option that repeats the gradient outside its nominal range.
        @inlinable public static var `repeat`: GraphicsContext.GradientOptions {
            get { Self(rawValue: 1 << 0)  }
        }

        /// An option that repeats the gradient outside its nominal range, reflecting every other instance.
        @inlinable public static var mirror: GraphicsContext.GradientOptions {
            get { Self(rawValue: 1 << 1) }
        }

        /// An option that interpolates between colors in a linear color space.
        @inlinable public static var linearColor: GraphicsContext.GradientOptions {
            get { Self(rawValue: 1 << 2) }
        }
    }
}