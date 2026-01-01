import Foundation 

/// Key used to specify the identifier and label associated with an entry of additional accessibility information.
/// Use AccessibilityCustomContentKey and the associated modifiers taking this value as a parameter in order to simplify clearing or replacing entries of additional information that are manipulated from multiple places in your code.
public struct AccessibilityCustomContentKey: Copyable, Equatable {
    
    // MARK: - Creating a key

    /// Create an AccessibilityCustomContentKey with the specified label.
    /// - Parameter labelKey: Localized text describing to the user what is contained in this additional information entry. For example: “orientation”. This will also be used as the identifier.
    public init(_ labelKey: LocalizedStringKey) {  }

    /// Create an AccessibilityCustomContentKey with the specified label and identifier.
    /// - Parameters:
    ///   - label: Localized text describing to the user what is contained in this additional information entry. For example: “orientation”.
    ///   - id: String used to identify the additional information entry to OpenSwiftUI. Adding an entry will replace any previous value with the same identifier.
    public init(_ label: Text, id: String) {  }
}