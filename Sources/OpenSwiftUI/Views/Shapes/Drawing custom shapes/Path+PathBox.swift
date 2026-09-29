import OpenSpatial

extension Path {

    /// A box that holds a Path value for storage in Path.Storage.
    package final class PathBox : Equatable, Sendable {

        /// The path stored in the box.
        package let path: Path

        /// Creates a box that holds the given path.
        /// 
        /// - Parameter path: The path to store in the box.
        package init(_ path: Path) {
            self.path = path
        }

        /// Returns true if two PathBox values contain equal paths.
        /// 
        /// - Parameters:
        ///   - lhs: The left-hand side value to compare.
        ///   - rhs: The right-hand side value to compare.
        /// - Returns: True if the two values are equal; otherwise, false.
        package static func == (lhs: PathBox, rhs: PathBox) -> Bool {
            lhs.path == rhs.path
        }
    }
}