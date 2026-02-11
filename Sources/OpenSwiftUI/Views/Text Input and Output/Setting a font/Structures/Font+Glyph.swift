import Foundation
import OpenSpatial

extension Font {

    /// The glyph in a font.
    struct Glyph : @unchecked Sendable {

        /// The glyph texture
        var texture: UInt32 = 0

        /// The glyph index.
        var index: Int = 0

        /// The glyph advance.
        var advance: Point3D = .zero

        /// The gliph offset.
        var offset: Point3D = .zero

        /// The glyph bearing.
        var bearing: Point3D = .zero

        /// The glyph frame.
        var size: Size3D = .zero

        /// The glyph UV coordinates.
        var uv: (u0: Double, v0: Double, u1: Double, v1: Double) = (0, 0, 0, 0)
    }
} 

extension Font.Glyph : Equatable {

    /// Check if two glyphs are equal.
    /// 
    /// - Parameters:
    ///   - lhs: The left glyph.
    ///   - rhs: The right glyph.
    /// - Returns: `true` if the glyphs are equal, `false` otherwise.
    static func == (lhs: Font.Glyph, rhs: Font.Glyph) -> Bool {
        lhs.index == rhs.index && 
        lhs.advance == rhs.advance && 
        lhs.offset == rhs.offset && 
        lhs.bearing == rhs.bearing &&
        lhs.size == rhs.size && 
        lhs.uv == rhs.uv
    }
}

extension Font.Glyph : Hashable {

    /// Hashes the glyph into the given hash.
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