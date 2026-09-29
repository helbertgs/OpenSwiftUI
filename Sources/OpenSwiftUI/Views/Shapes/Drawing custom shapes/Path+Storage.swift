import OpenSpatial

extension Path {

    /// The storage for the path's data.
    @frozen package enum Storage : Equatable, Sendable {

        /// The different kinds of storage for a path.
        case empty

        /// A rectangle.
        case rect(Rect3D)

        /// An ellipse.
        case ellipse(Rect3D)

        /// A rounded rectangle.
        indirect case roundedRect(Rect3D, Double)

        /// A custom path.
        indirect case path(Path.PathBox)
    }
}