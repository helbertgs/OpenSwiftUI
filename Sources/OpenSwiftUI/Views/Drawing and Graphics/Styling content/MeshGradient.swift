import OpenSpatial

public struct MeshGradient {

    // MARK: - Instance Properties

    /// The background color, this fills any points outside the defined vertex mesh.
    public let background: Color

    /// The color space in which to interpolate vertex colors.
    public let colorSpace: Color.RGBColorSpace

    /// The array of colors. Must contain width x height elements.
    public let colors: [Color]

    /// The height of the mesh, i.e. the number of vertices per column.
    public let height: Int

    /// The array of locations. Must contain width x height elements.
    public let locations: MeshGradient.Locations

    /// Whether cubic (smooth) interpolation should be used for the colors in the mesh (rather than only for the shape of the mesh).
    public let smoothsColors: Bool

    /// The width of the mesh, i.e. the number of vertices per row.
    public let width: Int

}

extension MeshGradient {

    /// An array of 2D locations and their control points.
    public enum Locations : Equatable, Sendable {
        
        // MARK: - Enumeration Cases
        
        /// Vertices explicitly specifying their location and control points.
        case bezierPoints([MeshGradient.BezierPoint])

        /// Vertices are only specified as their location, their control points are inferred from the locations of their neighbors.
        case points([Point3D])
    }

    public struct BezierPoint : Equatable, Sendable {

        // MARK: - Instance Properties

        /// The position of the vertex.
        public let position: Point3D
        
        /// The Bezier control point of the vertex’s leading edge.
        public let leadingControlPoint: Point3D
        
        /// The Bezier control point of the vertex’s top edge.
        public let topControlPoint: Point3D
       
        /// The Bezier control point of the vertex’s trailing edge.
        public let trailingControlPoint: Point3D

        /// The Bezier control point of the vertex’s bottom edge.
        public let bottomControlPoint: Point3D

        /// Creates a new vertex.
        /// 
        /// - Parameters:
        ///   - position: The Bezier control point of the vertex’s top edge.
        ///   - leadingControlPoint: The Bezier control point of the vertex’s leading edge.
        ///   - topControlPoint: The Bezier control point of the vertex’s trailing edge.
        ///   - trailingControlPoint: The Bezier control point of the vertex’s bottom edge
        ///   - bottomControlPoint: The position of the vertex in the coordinate space the gradient is interpreted in.
        public init(position: Point3D, leadingControlPoint: Point3D, topControlPoint: Point3D, trailingControlPoint: Point3D, bottomControlPoint: Point3D) {
            self.position = position
            self.leadingControlPoint = leadingControlPoint
            self.topControlPoint = topControlPoint
            self.trailingControlPoint = trailingControlPoint
            self.bottomControlPoint = bottomControlPoint
        }
    }
}