import Foundation

/// An alignment position for text along the horizontal axis.
@frozen public enum TextAlignment : CaseIterable, Codable, Copyable, Equatable, Hashable, Sendable {

    // MARK: - Getting text alignments

    case center
    case leading
    case trailing
}