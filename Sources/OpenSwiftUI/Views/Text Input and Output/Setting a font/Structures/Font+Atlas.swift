import Foundation

extension Font {

    /// A font atlas.
    struct Atlas : Sendable {

        ///  The glyphs in the Atlas.
        var glyphs: [Glyph]

        /// Create a new atlas with the given glyphs.
        /// 
        /// - Parameter glyphs: The glyphs in the atlas.
        init(_ glyphs: [Glyph]) {
            self.glyphs = glyphs
        }
    }
}