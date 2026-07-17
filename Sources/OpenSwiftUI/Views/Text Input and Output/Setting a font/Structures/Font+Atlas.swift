//
// Font+Atlas.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Feb 10, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A font atlas.
    struct Atlas : Equatable, Hashable, Sendable {

        /// The glyphs in the atlas.
        var glyphs: [Glyph]

        /// The count of glyphs in the atlas.
        var count: Int {
            glyphs.count
        }

        /// Creates a new atlas with the given glyphs.
        ///
        /// - Parameter glyphs: The glyphs in the atlas.
        init(glyphs: [Glyph] = []) {
            self.glyphs = glyphs
        }

        /// Adds a new glyph to the atlas.
        ///
        /// - Parameter glyph: The glyph to add to the atlas.
        mutating func add(glyph: Glyph) {
            glyphs.append(glyph)
        }

        /// Removes a glyph from the atlas.
        ///
        /// - Parameter glyph: The glyph to remove from the atlas.
        mutating func remove(glyph: Glyph) {
            glyphs.removeAll { $0.index == glyph.index }
        }

        /// Clears the atlas.
        mutating func clear() {
            glyphs.removeAll()
        }
    }
}