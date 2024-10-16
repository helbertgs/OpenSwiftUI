import Foundation

/// A view that arranges its subviews in a vertical line.
///
/// Unlike ``LazyVStack``, which only renders the views when your app needs to
/// display them, a `VStack` renders the views all at once, regardless
/// of whether they are on- or offscreen. Use the regular `VStack` when you have
/// a small number of subviews or don't want the delayed rendering behavior
/// of the "lazy" version.
///
/// The following example shows a simple vertical stack of 10 text views:
///
///     var body: some View {
///         VStack(
///             alignment: .leading,
///             spacing: 10
///         ) {
///             ForEach(
///                 1...10,
///                 id: \.self
///             ) {
///                 Text("Item \($0)")
///             }
///         }
///     }
///
/// ![Ten text views, named Item 1 through Item 10, arranged in a
/// vertical line.](SwiftUI-VStack-simple.png)
///
/// > Note: If you need a vertical stack that conforms to the ``Layout``
/// protocol, like when you want to create a conditional layout using
/// ``AnyLayout``, use ``VStackLayout`` instead.
@frozen public struct VStack<Content> : View where Content : View {

    public let layout: _VStackLayout
    public let content: Content

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    public var body: Never {
        fatalError()
    }

    /// Creates an instance with the given spacing and horizontal alignment.
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This
    ///     guide has the same vertical screen coordinate for every subview.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - content: A view builder that creates the content of this stack.
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: Float? = nil, @ViewBuilder content: () -> Content) {
        self.layout = .init(alignment: alignment, spacing: spacing)
        self.content = content()
    }

    public static func _makeView(view: _GraphValue<VStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        .init()
    }
}

/// A vertical container that you can use in conditional layouts.
///
/// This layout container behaves like a ``VStack``, but conforms to the
/// ``Layout`` protocol so you can use it in the conditional layouts that you
/// construct with ``AnyLayout``. If you don't need a conditional layout, use
/// ``VStack`` instead.
@frozen public struct _VStackLayout: Equatable, Hashable, Sendable {

    /// The horizontal alignment of subviews.
    public let alignment: HorizontalAlignment

    /// The distance between adjacent subviews.
    ///
    /// Set this value to `nil` to use default distances between subviews.
    public let spacing: Float?

    /// Creates a vertical stack with the specified spacing and horizontal
    /// alignment.
    ///
    /// - Parameters:
    ///     - alignment: The guide for aligning the subviews in this stack. It
    ///       has the same horizontal screen coordinate for all subviews.
    ///     - spacing: The distance between adjacent subviews. Set this value
    ///       to `nil` to use default distances between subviews.
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: Float? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
}