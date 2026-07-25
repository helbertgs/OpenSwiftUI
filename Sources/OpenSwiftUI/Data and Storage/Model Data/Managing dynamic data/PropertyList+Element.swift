import Foundation

extension PropertyList {

    /// Base class for every node in the linked list.
    ///
    /// Subclasses store a strongly typed value and the key identity needed to
    /// look up and replace nodes.
    class Element: @unchecked Sendable, CustomStringConvertible {
        
        /// The next node in the list, or `nil` if this is the tail.
        var next: Element?
        var description: String { "\(Self.self)" }
    }
}