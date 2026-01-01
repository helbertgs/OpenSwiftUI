import Foundation

/// Junction types for stroked lines.
public enum LineJoin : String, BitwiseCopyable, Codable, Copyable, Equatable, Hashable, Sendable {

    // MARK: - Constants

    case miter

    /// A join with a rounded end. 
    /// 
    /// OpenSwiftUI draws the line to extend beyond the endpoint of the path. 
    /// The line ends with a semicircular arc with a radius of 1/2 the line’s width, centered on the endpoint.
    case round

    /// A join with a squared-off end. 
    /// OpenSwiftUI draws the line to extend beyond the endpoint of the path, for a distance of 1/2 the line’s width.
    case bevel
}