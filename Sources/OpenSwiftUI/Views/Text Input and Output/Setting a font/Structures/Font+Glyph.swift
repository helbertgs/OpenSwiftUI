//
// Font+Glyph.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Feb 10, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenSpatial

extension Font {

    /// A glyph in a font.
    struct Glyph : Equatable, Hashable, @unchecked Sendable {

        /// The glyph index.
        var index: UInt32 = 0

        /// The glyph advance.
        var advance: Point3D = .zero

        /// The glyph offset.
        var offset: Point3D = .zero

        /// The glyph bearing.
        var bearing: Point3D = .zero

        /// The glyph size.
        var size: Size3D = .zero

        /// The glyph UV coordinates.
        var uv: (u0: Double, v0: Double, u1: Double, v1: Double) = (0, 0, 0, 0)

        /// The glyph buffer.
        var buffer: UnsafeBufferPointer<UInt8>? = nil

        /// Creates a new glyph with the given index, advance, and offset.
        ///
        /// - Parameter index: The glyph index.
        /// - Parameter advance: The glyph advance.
        /// - Parameter offset: The glyph offset.
        /// - Parameter bearing: The glyph bearing.
        /// - Parameter size: The glyph size.
        /// - Parameter uv: The glyph UV coordinates.
        init(index: UInt32 = 0, advance: Point3D = .zero, offset: Point3D = .zero, bearing: Point3D = .zero, size: Size3D = .zero, uv: (u0: Double, v0: Double, u1: Double, v1: Double) = (0, 0, 0, 0)) {
            self.index = index
            self.advance = advance
            self.offset = offset
            self.bearing = bearing
            self.size = size
            self.uv = uv
        }

        /// Checks if two glyphs are equal.
        ///
        /// - Parameter lhs: The left glyph.
        /// - Parameter rhs: The right glyph.
        /// - Returns: `true` if the glyphs are equal, `false` otherwise.
        static func == (lhs: Font.Glyph, rhs: Font.Glyph) -> Bool {
            lhs.index == rhs.index && lhs.advance == rhs.advance && lhs.offset == rhs.offset && lhs.bearing == rhs.bearing && lhs.size == rhs.size && lhs.uv == rhs.uv
        }

        /// Hashes the glyph into the given hasher.
        ///
        /// - Parameter hasher: The hasher to hash the glyph into.
        func hash(into hasher: inout Hasher) {
            hasher.combine(index)
            hasher.combine(advance)
            hasher.combine(offset)
            hasher.combine(bearing)
            hasher.combine(size)
            hasher.combine(uv.u0)
            hasher.combine(uv.v0)
            hasher.combine(uv.u1)
            hasher.combine(uv.v1)
        }
    }
}