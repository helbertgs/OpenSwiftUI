//
// GraphicsContext+ClipOptions.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension GraphicsContext {

    /// Options that affect the use of clip shapes.
    /// 
    /// Use these options to affect how OpenSwiftUI interprets a clip shape when you call ``clip(to:style:options:)`` to add a path to the array of clip shapes, or when you call ``clipToLayer(opacity:options:content:)`` to add a clipping layer.
    @frozen public struct ClipOptions : BitwiseCopyable, Copyable, Equatable, OptionSet, Sendable {
        
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

        // MARK: - Getting clip options

        /// An option to invert the shape or layer alpha as the clip mask.
        @inlinable public static var inverse: GraphicsContext.ClipOptions {
            get { Self(rawValue: 1 << 0) }
        }
    }
}