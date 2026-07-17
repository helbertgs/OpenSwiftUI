//
// GraphicsContext+BlurOptions.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension GraphicsContext {
    
    /// Options that configure the graphics context filter that creates blur.
    /// 
    /// You can use a set of these options when you call ``blur(radius:options:)`` to create a ``GraphicsContext.Filter`` that adds blur to an object that you draw into a ``GraphicsContext``.
    @frozen public struct BlurOptions : BitwiseCopyable, Copyable, Equatable, OptionSet, Sendable {
        
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

        /// Creates a new instance with specified.
        @inlinable public init() {
            self.rawValue = 0
        }

        // MARK: - Getting blur options

        /// An option that causes the filter to dither the result, to reduce banding.
        @inlinable public static var dithersResult: GraphicsContext.BlurOptions {
            get { Self(rawValue: 1 << 1) }
        }

        /// An option that causes the filter to ensure the result is completely opaque.
        @inlinable public static var opaque: GraphicsContext.BlurOptions {
            get { Self(rawValue: 1 << 0) }
        }
    }
}