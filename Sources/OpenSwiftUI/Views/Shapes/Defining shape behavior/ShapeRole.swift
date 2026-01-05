import Foundation

/// Ways of styling a shape.
public enum ShapeRole : String, Codable, Copyable, Equatable, Hashable, Sendable {

    // MARK: - Getting shape roles

    /// Indicates to the shape’s style that OpenSwiftUI fills the shape.
    case fill

    /// Indicates to the shape’s style that OpenSwiftUI applies a stroke to the shape’s path.
    case stroke

    /// Indicates to the shape’s style that OpenSwiftUI uses the shape as a separator.
    case separator
}