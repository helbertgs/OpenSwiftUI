import OpenSpatial

extension GraphicsContext {

    /// An image resolved to a particular environment.
    /// 
    /// You resolve an ``Image`` in preparation for drawing it into a context, either manually by calling ``resolve(_:)``, or automatically when calling ``draw(_:in:style:)`` or ``draw(_:at:anchor:)``. 
    /// The resolved image takes into account environment values like the display resolution and current color scheme.
    public struct ResolvedImage {

        // MARK: - Getting the image properties
        
        /// The size of the image.
        public var size: Size3D
        
        /// The distance from the top of the image to its baseline.
        public let baseline: Double
        
        /// An optional shading to fill the image with.
        public var shading: GraphicsContext.Shading?
    }
}