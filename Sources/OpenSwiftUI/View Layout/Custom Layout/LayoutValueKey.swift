import Swift

/// A key for accessing a layout value of a layout container's subviews.
///
/// If you create a custom layout by defining a type that conforms to the
/// ``Layout`` protocol, you can also create custom layout values
/// that you set on individual views, and that your container view can access
/// to guide its layout behavior. Your custom values resemble
/// the built-in layout values that you set with view modifiers
/// like ``View/layoutPriority(_:)`` and ``View/zIndex(_:)``, but have a
/// purpose that you define.
///
/// To create a custom layout value, define a type that conforms to the
/// `LayoutValueKey` protocol and implement the one required property that
/// returns the default value of the property. For example, you can create
/// a property that defines an amount of flexibility for a view, defined as
/// an optional floating point number with a default value of `nil`:
///
///     private struct Flexibility: LayoutValueKey {
///         static let defaultValue: CGFloat? = nil
///     }
///
/// The Swift compiler infers this particular key's associated type as an
/// optional <doc://com.apple.documentation/documentation/CoreFoundation/CGFloat>
/// from this definition.
///
/// ### Set a value on a view
///
/// Set the value on a view by adding the ``View/layoutValue(key:value:)``
/// view modifier to the view. To make your custom value easier to work
/// with, you can do this in a convenience modifier in an extension of the
/// ``View`` protocol:
///
///     extension View {
///         func layoutFlexibility(_ value: CGFloat?) -> some View {
///             layoutValue(key: Flexibility.self, value: value)
///         }
///     }
///
/// Use your modifier to set the value on any views that need a nondefault
/// value:
///
///     BasicVStack {
///         Text("One View")
///         Text("Another View")
///             .layoutFlexibility(3)
///     }
///
/// Any view that you don't explicitly set a value for uses the default
/// value, as with the first ``Text`` view, above.
///
/// ### Retrieve a value during layout
///
/// Access a custom layout value using the key as an index
/// on subview's proxy (an instance of ``LayoutSubview``)
/// and use the value to make decisions about sizing, placement, or other
/// layout operations. For example, you might read the flexibility value
/// in your layout view's ``LayoutSubview/sizeThatFits(_:)`` method, and
/// adjust your size calculations accordingly:
///
///     extension BasicVStack {
///         func sizeThatFits(
///             proposal: ProposedViewSize,
///             subviews: Subviews,
///             cache: inout Void
///         ) -> CGSize {
///
///             // Map the flexibility property of each subview into an array.
///             let flexibilities = subviews.map { subview in
///                 subview[Flexibility.self]
///             }
///
///             // Calculate and return the size of the layout container.
///             // ...
///         }
///     }
/// 
public protocol LayoutValueKey {

    /// The type of the key's value.
    ///
    /// Swift typically infers this type from your implementation of the
    /// ``defaultValue`` property, so you don't have to define it explicitly.
    associatedtype Value

    /// The default value of the key.
    ///
    /// Implement the `defaultValue` property for a type that conforms to the
    /// ``LayoutValueKey`` protocol. For example, you can create a `Flexibility`
    /// layout value that defaults to `nil`:
    ///
    ///     private struct Flexibility: LayoutValueKey {
    ///         static let defaultValue: CGFloat? = nil
    ///     }
    ///
    /// The type that you declare for the `defaultValue` sets the layout
    /// key's ``Value`` associated type. The Swift compiler infers the key's
    /// associated type in the above example as an optional
    /// <doc://com.apple.documentation/documentation/CoreFoundation/CGFloat>.
    ///
    /// Any view that you don't explicitly set a value for uses the default
    /// value. Override the default value for a view using the
    /// ``View/layoutValue(key:value:)`` modifier.
    static var defaultValue: Self.Value { get }
}