//
// Font+PointSizeModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// The point size modifier.
    struct PointSizeModifier : FontModifier {

        // MARK: - Checking Characteristics

        /// The size of the font.
        let size: Double

        // MARK: - Creating a PointSize modifier

        /// Creates a new point size modifier with the given size.
        ///
        /// - Parameter size: The size of the font.
        init(_ size: Double) {
            self.size = size
        }

        // MARK: - Resolving a Font

        /// Resolves a font with the point size modifier applied.
        /// 
        /// - Parameter context: The font context to resolve the font with.
        /// - Returns: A resolved font with the point size modifier applied.
        func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.pointSize = size

            return resolved
        }
    }
}
