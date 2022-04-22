import Swift

/// A type that represents part of your app's user interface and provides
/// modifiers that you use to configure views.
///
/// You create custom views by declaring types that conform to the `View`
/// protocol. Implement the required ``View/body-swift.property`` computed
/// property to provide the content for your custom view.
///
///     struct MyView: View {
///         var body: some View {
///             Text("Hello, World!")
///         }
///     }
///
/// Assemble the view's body by combining one or more of the primitive views
/// provided by OpenSwiftUI, like the ``Text`` instance in the example above, plus
/// other custom views that you define, into a hierarchy of views. For more
/// information about creating custom views, see <doc:Declaring-a-Custom-View>.
///
/// The `View` protocol provides a set of modifiers — protocol
/// methods with default implementations — that you use to configure
/// views in the layout of your app. Modifiers work by wrapping the
/// view instance on which you call them in another view with the specified
/// characteristics, as described in <doc:Configuring-Views>.
/// For example, adding the ``View/opacity(_:)`` modifier to a
/// text view returns a new view with some amount of transparency:
///
///     Text("Hello, World!")
///         .opacity(0.5) // Display partially transparent text.
///
/// The complete list of default modifiers provides a large set of controls
/// for managing views.
/// For example, you can fine tune <doc:View-Layout>,
/// add <doc:View-Accessibility> information,
/// and respond to <doc:View-Input-and-Events>.
/// You can also collect groups of default modifiers into new,
/// custom view modifiers for easy reuse.
@_typeEraser(AnyView)
public protocol View {

    // MARK: - Associated Type(s).
    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    associatedtype Body: View

    // MARK: - Public Property(ies).
    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of primitive views that OpenSwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @ViewBuilder var body: Self.Body { get }
}

extension View {
    /// Applies a modifier to a view and returns a new view.
    ///
    /// Use this modifier to combine a ``View`` and a ``ViewModifier``, to
    /// create a new view. For example, if you create a view modifier for
    /// a new kind of caption with blue text surrounded by a rounded rectangle:
    ///
    ///     struct BorderedCaption: ViewModifier {
    ///         func body(content: Content) -> some View {
    ///             content
    ///                 .font(.caption2)
    ///                 .padding(10)
    ///                 .overlay(
    ///                     RoundedRectangle(cornerRadius: 15)
    ///                         .stroke(lineWidth: 1)
    ///                 )
    ///                 .foregroundColor(Color.blue)
    ///         }
    ///     }
    ///
    /// You can use ``modifier(_:)`` to extend ``View`` to create new modifier
    /// for applying the `BorderedCaption` defined above:
    ///
    ///     extension View {
    ///         func borderedCaption() -> some View {
    ///             modifier(BorderedCaption())
    ///         }
    ///     }
    ///
    /// Then you can apply the bordered caption to any view:
    ///
    ///     Image(systemName: "bus")
    ///         .resizable()
    ///         .frame(width:50, height:50)
    ///     Text("Downtown Bus")
    ///         .borderedCaption()
    ///
    /// ![A screenshot showing the image of a bus with a caption reading
    /// Downtown Bus. A view extension, using custom a modifier, renders the
    ///  caption in blue text surrounded by a rounded
    ///  rectangle.](OpenSwiftUI-View-ViewModifier.png)
    ///
    /// - Parameter modifier: The modifier to apply to this view.
    @inlinable public func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(self, modifier)
    }
}

extension View {
    public func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> some View {
        modifier(_EnvironmentKeyWritingModifier(keyPath: keyPath, value: value))
    }
}
