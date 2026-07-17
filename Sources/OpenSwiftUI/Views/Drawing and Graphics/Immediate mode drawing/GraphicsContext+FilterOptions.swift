//
// GraphicsContext+FilterOptions.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension GraphicsContext {
    
    /// Options that configure a filter that you add to a graphics context.
    /// 
    /// You can use filter options to configure a ``GraphicsContext.Filter`` that you apply to a ``GraphicsContext`` with the ``addFilter(_:options:)`` method.
    @frozen public struct FilterOptions : BitwiseCopyable, Copyable, Equatable, OptionSet, Sendable {

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

        // MARK: - Getting filter options
    
        /// An option that causes the filter to perform calculations in a linear color space.
        @inlinable public static var linearColor: GraphicsContext.FilterOptions {
            get { Self(rawValue: 1 << 0) }
        }
    }
}