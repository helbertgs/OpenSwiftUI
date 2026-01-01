import Foundation

/// Textual context that assistive technologies can use to improve the presentation of spoken text.
public struct AccessibilityTextContentType: Sendable {
    // MARK: - Getting content types

    /// A type that represents text used for input, like in the Terminal app.
    public static let console: AccessibilityTextContentType = .init()

    /// A type that represents text used by a file browser, like in the Finder app in macOS.
    public static let fileSystem: AccessibilityTextContentType = .init()

    /// A type that represents text used in a message, like in the Messages app.
    public static let messaging: AccessibilityTextContentType = .init()

    /// A type that represents text used in a story or poem, like in the Books app.
    public static let narrative: AccessibilityTextContentType = .init()

    /// A type that represents generic text that has no specific type.
    public static let plain: AccessibilityTextContentType = .init()

    /// A type that represents text used in source code, like in Swift Playgrounds.
    public static let sourceCode: AccessibilityTextContentType = .init()

    /// A type that represents text used in a grid of data, like in the Numbers app.
    public static let spreadsheet: AccessibilityTextContentType = .init()

    /// A type that represents text used in a document, like in the Pages app.
    public static let wordProcessing: AccessibilityTextContentType = .init()

    init() { }
}