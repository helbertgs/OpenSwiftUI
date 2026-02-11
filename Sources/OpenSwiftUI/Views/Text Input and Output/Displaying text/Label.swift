import Foundation

public struct Label<Title, Icon> : Sendable, View where Title : View, Icon : View {

    // MARK: - Type Alias.

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    // MARK: - Properties.

    /// A view builder that creates the label's title.
    let title: () -> Title

    /// A view builder that creates the label's icon.
    let icon: () -> Icon

    // MARK: - Creating a Label.
    
    /// Creates a label with a custom title and icon.
    /// 
    /// - Parameters:
    ///   - title: A view builder that creates the label's title.
    ///   - icon: A view builder that creates the label's icon.
    public init(@ViewBuilder title: @escaping () -> Title, @ViewBuilder icon: @escaping () -> Icon) {
        self.title = title
        self.icon = icon
    }

    // MARK: - Static Function(s).

    nonisolated public static func _makeView(view: _GraphValue<Label<Title, Icon>>, inputs: _ViewInputs) -> _ViewOutputs {
        .init()
    }
}

extension Label where Title == Text, Icon == Image {

    /// Creates a label with an icon image and a title generated from a localized string.
    /// 
    /// - Parameters:
    ///   - titleKey: The key for the localized title string.
    ///   - name: The name of the image to use for the icon.
    public init(_ titleKey: LocalizedStringKey, image name: Swift.String) {
        self.init { Text(titleKey) } icon: { Image(name) }
    }
  
    /// Creates a label with an icon image and a title generated from a localized string resource.
    /// 
    /// - Parameters:
    ///   - titleResource: The localized string resource for the label's title.
    ///   - name: The name of the image to use for the icon.
    public init(_ titleResource: LocalizedStringResource, image name: Swift.String) {
        self.init { Text(titleResource) } icon: { Image(name) }
    }
  
    /// Creates a label with an icon image and a title generated from a string.
    /// 
    /// - Parameters:
    ///   - titleKey: The string to use for the label's title.
    ///   - name: The name of the system image to use for the icon.
    public init(_ titleKey: LocalizedStringKey, systemImage name: Swift.String) {
        self.init { Text(titleKey) } icon: { Image(systemName: name) }
    }

    /// Creates a label with an icon image and a title generated from a localized string resource.
    /// 
    /// - Parameters:
    ///   - titleResource: The localized string resource for the label's title.
    ///   - name: The name of the system image to use for the icon.
    public init(_ titleResource: LocalizedStringResource, systemImage name: Swift.String) {
        self.init { Text(titleResource) } icon: { Image(systemName: name) }
    }

    /// Creates a label with an icon image and a title generated from a string.
    /// 
    /// - Parameters:
    ///   - title: The string to use for the label's title.
    ///   - name: The name of the image to use for the icon.
    public init<S>(_ title: S, image name: String) where S : Swift.StringProtocol {
        self.init { Text(title) } icon: { Image(name) }
    }

    /// Creates a label with an icon image and a title generated from a string.
    /// 
    /// - Parameters:
    ///   - title: The string to use for the label's title.
    ///   - name: The name of the system image to use for the icon.
    public init<S>(_ title: S, systemImage name: String) where S : Swift.StringProtocol {
        self.init { Text(title) } icon: { Image(systemName: name) }
    }
}

extension Label where Title == Text, Icon == Image {

    /// Creates a label with an icon image and a title generated from a localized string.
    /// 
    /// - Parameters:
    ///   - titleKey: The localized string key for the label's title.
    ///   - resource: The image resource to use for the icon.
    public init(_ titleKey: LocalizedStringKey, image resource: ImageResource) {
        self.init { Text(titleKey) } icon: { Image(resource) }
    }

    /// Creates a label with an icon image and a title generated from a localized string resource.
    /// 
    /// - Parameters:
    ///   - titleResource: The localized string resource for the label's title.
    ///   - resource: The image resource to use for the icon.
    public init(_ titleResource: LocalizedStringResource, image resource: ImageResource) {
        self.init { Text(titleResource) } icon: { Image(resource) }
    }

    /// Creates a label with an icon image and a title generated from a string.
    /// 
    /// - Parameters:
    ///   - title: The string to use for the label's title.
    ///   - resource: The image resource to use for the icon.
    public init<S>(_ title: S, image resource: ImageResource) where S : Swift.StringProtocol {
        self.init { Text(title) } icon: { Image(resource) }
    }
}