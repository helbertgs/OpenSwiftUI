import Foundation

/// Objects that define custom content and the timing of its output.
public class AXCustomContent {

    // MARK: - Defining custom content

    /// A localized string that identifies the label for this content.
    public let label: String

    /// A localized string that provides a value for the label.
    public let value: String

    /// An object that determines when to output custom accessibility content.
    public let importance: AXCustomContent.Importance

    // MARK: - Creating custom content

    /// Creates new custom content with a label and value.
    /// - Parameters:
    ///   - label: A localized string that identifies the label for this content.
    ///   - value: A localized string that provides a value for the label.
    ///   - importance: An object that determines when to output custom accessibility content.
    public init(label: String, value: String, importance: Importance = .default) {
        self.label = label
        self.value = value
        self.importance = importance
    }

    /// Objects that control the timing of content output.
    public enum Importance: BitwiseCopyable, Equatable, Hashable, Sendable {
        
        // MARK: - Setting content importance

        /// Output the content to the user on demand.
        case `default`

        /// Output the content to the user immediately.
        case high
    }
}