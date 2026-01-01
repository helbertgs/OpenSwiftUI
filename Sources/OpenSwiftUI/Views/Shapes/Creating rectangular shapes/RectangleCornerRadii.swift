import Foundation

/// Describes the corner radius values of a rounded rectangle with uneven corners.
@frozen public struct RectangleCornerRadii : BitwiseCopyable, Codable, Copyable, Equatable, Sendable {

    // MARK: - Getting values for specific corners

    /// The radius of the top-leading corner.
    public let topLeading: Double

    /// The radius of the top-trailing corner.
    public let topTrailing: Double

    /// The radius of the bottom-leading corner.
    public let bottomLeading: Double

    /// The radius of the bottom-trailing corner.
    public let bottomTrailing: Double

    // MARK: - Creating a set of radii

    /// Creates a new set of corner radii for a rounded rectangle with uneven corners.
    /// 
    /// - Parameters:
    ///   - topLeading: The radius of the top-leading corner.
    ///   - topTrailing: The radius of the bottom-leading corner.
    ///   - bottomLeading: The radius of the bottom-trailing corner.
    ///   - bottomTrailing: The radius of the top-trailing corner.
    public init(topLeading: Double = 0, topTrailing: Double = 0, bottomLeading: Double = 0, bottomTrailing: Double = 0) {
        self.topLeading = topLeading
        self.topTrailing = topTrailing
        self.bottomLeading = bottomLeading
        self.bottomTrailing = bottomTrailing
    }
}