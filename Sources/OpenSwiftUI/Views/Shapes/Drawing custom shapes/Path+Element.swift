import OpenSpatial

extension Path {

    /// An element of a path.
    @frozen public enum Element : BitwiseCopyable, Copyable, Equatable, Sendable {

        // MARK: - Getting path elements
        
        /// A line from the start point of the current subpath (if any) to the current point, which terminates the subpath.
        case closeSubpath

        /// A cubic Bézier curve from the previous current point to the given end-point, using the two control points to define the curve.
        case curve(to: Point3D, control1: Point3D, control2: Point3D)

        /// A line from the previous current point to the given point, which becomes the new current point.
        case line(to: Point3D)

        /// A path element that terminates the current subpath (without closing it) and defines a new current point.
        case move(to: Point3D)

        /// A quadratic Bézier curve from the previous current point to the given end-point, using the single control point to define the curve.
        case quadCurve(to: Point3D, control: Point3D)
    }
}