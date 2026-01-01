import Foundation

/// Styles for rendering the endpoint of a stroked line.
@frozen public enum LineCap : String, BitwiseCopyable, Codable, Copyable, Equatable, Hashable, Sendable {

    // MARK: - Constants

    /// A line with a squared-off end. 
    /// 
    /// OpenSwiftUI draws the line to extend only to the exact endpoint of the path. 
    /// This is the default.
    case butt

    /// A line with a rounded end. 
    /// 
    /// OpenSwiftUI draws the line to extend beyond the endpoint of the path. 
    /// The line ends with a semicircular arc with a radius of 1/2 the line’s width, centered on the endpoint.
    case round

    /// A line with a squared-off end. 
    /// 
    /// OpenSwiftUI extends the line beyond the endpoint of the path for a distance equal to half the line width.
    case square
}