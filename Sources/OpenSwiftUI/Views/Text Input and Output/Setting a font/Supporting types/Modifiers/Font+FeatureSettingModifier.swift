//
// Font+FeatureSettingModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// The feature setting modifier.
    struct FeatureSettingModifier : FontModifier {

        // MARK: - Checking Characteristics

        /// The type of the feature.
        let type: Int

        /// The selector of the feature.
        let selector: Int

        // MARK: - Creating a FeatureSettingModifier

        /// Creates a new feature setting modifier with the given type and selector.
        ///
        /// - Parameter type: The type of the feature.
        /// - Parameter selector: The selector of the feature.
        init(type: Int, selector: Int) {
            self.type = type
            self.selector = selector
        }

        // MARK: - Resolving a Font

        /// Resolves a font with the feature settings modifier applied.
        /// 
        /// - Parameter context: The font context to resolve the font with.
        /// - Returns: A resolved font with the feature setting modifier applied.
        func resolve(_ context: Font.Context) -> Font.Resolved {
            context.resolved
        }
    }
}
