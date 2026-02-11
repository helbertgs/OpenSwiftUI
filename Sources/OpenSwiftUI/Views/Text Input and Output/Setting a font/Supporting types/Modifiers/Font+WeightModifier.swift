//
// Font+WeightModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// The weight modifier.
    struct WeightModifier : FontModifier {

        // MARK: - Checking Characteristics

        /// The weight of the font.
        let weight: Font.Weight

        // MARK: - Creating a Weight modifier

        /// Creates a new weight modifier with the given weight.
        ///
        /// - Parameter weight: The weight of the font.
        init(_ weight: Font.Weight) {
            self.weight = weight
        }

        // MARK: - Resolving a Font

        /// Resolves a font with the weight modifier applied.
        /// 
        /// - Parameter context: The font context to resolve the font with.
        /// - Returns: A resolved font with the weight modifier applied.
        func resolve(_ context: Font.Context) -> Font.Resolved {
            var resolved = context.resolved
            resolved.weight = weight

            return resolved
        }
    }
}
