import Foundation

/// Defines the shape of a rounded rectangle’s corners.
public enum RoundedCornerStyle : String, Codable, Copyable, Equatable, Hashable, Sendable {

    // MARK: - Getting corner styles

    /// Quarter-circle rounded rect corners.
    case circular
    
    /// Continuous curvature rounded rect corners.
    case continuous
}