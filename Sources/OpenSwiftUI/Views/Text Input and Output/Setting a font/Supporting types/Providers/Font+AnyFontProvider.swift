//
// Font+AnyFontProvider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A type-erased font provider.
    class AnyFontProvider : @unchecked Sendable {

        // MARK: - Resolving a Font

        /// Creates a type-erased font provider.
        /// 
        /// - Parameter context: The font context.
        /// - Returns: The resolved font.
        func resolve(_ context: Font.Context) -> Font.Resolved {
            fatalError("Subclasses must implement this")
        }
    }
}
