/// A proxy that represents one subview of a layout.
///
/// This type acts as a proxy for a view that your custom layout container
/// places in the user interface. ``Layout`` protocol methods
/// receive a ``LayoutSubviews`` collection that contains exactly one
/// proxy for each of the subviews arranged by your container.
///
/// Use a proxy to get information about the associated subview, like its
/// dimensions, layout priority, or custom layout values. You also use the
/// proxy to tell its corresponding subview where to appear by calling the
/// proxy's ``LayoutSubview/place(at:anchor:proposal:)`` method.
/// Do this once for each subview from your implementation of the layout's
/// ``Layout/placeSubviews(in:proposal:subviews:cache:)`` method.
///
/// You can read custom layout values associated with a subview
/// by using the property's key as an index on the subview. For more
/// information about defining, setting, and reading custom values,
/// see ``LayoutValueKey``.
public struct LayoutSubview : Equatable {


    /// Gets the value for the subview that's associated with the specified key.
    ///
    /// If you define a custom layout value using ``LayoutValueKey``,
    /// you can read the key's associated value for a given subview in
    /// a layout container by indexing the container's subviews with
    /// the key type. For example, if you define a `Flexibility` key
    /// type, you can put the associated values of all the layout's
    /// subviews into an array:
    ///
    ///     let flexibilities = subviews.map { subview in
    ///         subview[Flexibility.self]
    ///     }
    ///
    /// For more information about creating a custom layout, see ``Layout``.
    public subscript<K>(key: K.Type) -> K.Value where K : LayoutValueKey {
        fatalError()
    }

    /// The layout priority of the subview.
    ///
    /// If you define a custom layout type using the ``Layout``
    /// protocol, you can read this value from subviews and use the value
    /// when deciding how to assign space to subviews. For example, you
    /// can read all of the subview priorities into an array before
    /// placing the subviews in a custom layout type called `BasicVStack`:
    ///
    ///     extension BasicVStack {
    ///         func placeSubviews(
    ///             in bounds: CGRect,
    ///             proposal: ProposedViewSize,
    ///             subviews: Subviews,
    ///             cache: inout ()
    ///         ) {
    ///             let priorities = subviews.map { subview in
    ///                 subview.priority
    ///             }
    ///
    ///             // Place views, based on priorities.
    ///         }
    ///     }
    ///
    /// Set the layout priority for a view that appears in your layout by
    /// applying the ``View/layoutPriority(_:)`` view modifier. For example,
    /// you can assign two different priorities to views that you arrange
    /// with `BasicVStack`:
    ///
    ///     BasicVStack {
    ///         Text("High priority")
    ///             .layoutPriority(10)
    ///         Text("Low priority")
    ///             .layoutPriority(1)
    ///     }
    ///
    public var priority: Double

    /// Asks the subview for its size.
    ///
    /// Use this method as a convenience to get the ``ViewDimensions/width``
    /// and ``ViewDimensions/height`` properties of the ``ViewDimensions``
    /// instance returned by the ``dimensions(in:)`` method, reported as a
    /// <doc://com.apple.documentation/documentation/CoreFoundation/CGSize>
    /// instance.
    ///
    /// - Parameter proposal: A proposed size for the subview. In SwiftUI,
    ///   views choose their own size, but can take a size proposal from
    ///   their parent view into account when doing so.
    ///
    /// - Returns: The size that the subview chooses for itself, given the
    ///   proposal from its container view.
    public func sizeThatFits(_ proposal: ProposedViewSize) -> Size {
        fatalError()
    }

    /// Asks the subview for its dimensions and alignment guides.
    ///
    /// Call this method to ask a subview of a custom ``Layout`` type
    /// about its size and alignment properties. You can call it from
    /// your implementation of any of that protocol's methods, like
    /// ``Layout/placeSubviews(in:proposal:subviews:cache:)`` or
    /// ``Layout/sizeThatFits(proposal:subviews:cache:)``, to get
    /// information for your layout calculations.
    ///
    /// When you call this method, you propose a size using the `proposal`
    /// parameter. The subview can choose its own size, but might take the
    /// proposal into account. You can call this method more than
    /// once with different proposals to find out if the view is flexible.
    /// For example, you can propose:
    ///
    /// * ``ProposedViewSize/zero`` to get the subview's minimum size.
    /// * ``ProposedViewSize/infinity`` to get the subview's maximum size.
    /// * ``ProposedViewSize/unspecified`` to get the subview's ideal size.
    ///
    /// If you need only the view's height and width, you can use the
    /// ``sizeThatFits(_:)`` method instead.
    ///
    /// - Parameter proposal: A proposed size for the subview. In SwiftUI,
    ///   views choose their own size, but can take a size proposal from
    ///   their parent view into account when doing so.
    ///
    /// - Returns: A ``ViewDimensions`` instance that includes a height
    ///   and width, as well as a set of alignment guides.
    public func dimensions(in proposal: ProposedViewSize) -> ViewDimensions {
        fatalError()
    }

    /// The subviews's preferred spacing values.
    ///
    /// This ``ViewSpacing`` instance indicates how much space a subview
    /// in a custom layout prefers to have between it and the next view.
    /// It contains preferences for all edges, and might take into account
    /// the type of both this and the adjacent view. If your ``Layout`` type
    /// places subviews based on spacing preferences, use this instance
    /// to compute a distance between this subview and the next. See
    /// ``Layout/placeSubviews(in:proposal:subviews:cache:)`` for an
    /// example.
    ///
    /// You can also merge this instance with instances from other subviews
    /// to construct a new instance that's suitable for the subviews' container.
    /// See ``Layout/spacing(subviews:cache:)-86z2e``.
    public var spacing: ViewSpacing

    /// Assigns a position and proposed size to the subview.
    ///
    /// Call this method from your implementation of the ``Layout``
    /// protocol's ``Layout/placeSubviews(in:proposal:subviews:cache:)``
    /// method for each subview arranged by the layout.
    /// Provide a position within the container's bounds where the subview
    /// should appear, and an anchor that indicates which part of the subview
    /// appears at that point.
    ///
    /// Include a proposed size that the subview can take into account when
    /// sizing itself. To learn the subview's size for a given proposal before
    /// calling this method, you can call the ``dimensions(in:)`` or
    /// ``sizeThatFits(_:)`` method on the subview with the same proposal.
    /// That enables you to know subview sizes before committing to subview
    /// positions.
    ///
    /// > Important: Call this method only from within your
    ///   ``Layout`` type's implementation of the
    /// ``Layout/placeSubviews(in:proposal:subviews:cache:)`` method.
    ///
    /// If you call this method more than once for a subview, the last call
    /// takes precedence. If you don't call this method for a subview, the
    /// subview appears at the center of its layout container and uses the
    /// layout container's size proposal.
    ///
    /// - Parameters:
    ///   - position: The place where the anchor of the subview should
    ///     appear in its container view, relative to container's bounds.
    ///   - anchor: The unit point on the subview that appears at `position`.
    ///     You can use a built-in point, like ``UnitPoint/center``, or
    ///     you can create a custom ``UnitPoint``.
    ///   - proposal: A proposed size for the subview. In SwiftUI,
    ///     views choose their own size, but can take a size proposal from
    ///     their parent view into account when doing so.
    public func place(at position: Point, anchor: UnitPoint = .topLeading, proposal: ProposedViewSize) {
        fatalError()
    }

    public static func == (lhs: LayoutSubview, rhs: LayoutSubview) -> Bool {
        lhs.priority == rhs.priority && lhs.spacing == rhs.spacing
    }
}

/// A collection of proxy values that represent the subviews of a layout view.
///
/// You receive a `LayoutSubviews` input to your implementations of
/// ``Layout`` protocol methods, like
/// ``Layout/placeSubviews(in:proposal:subviews:cache:)`` and
/// ``Layout/sizeThatFits(proposal:subviews:cache:)``. The `subviews`
/// parameter (which the protocol aliases to the ``Layout/Subviews`` type)
/// is a collection that contains proxies for the layout's subviews (of type
/// ``LayoutSubview``). The proxies appear in the collection in the same
/// order that they appear in the ``ViewBuilder`` input to the layout
/// container. Use the proxies to perform layout operations.
///
/// Access the proxies in the collection as you would the contents of any
/// Swift random-access collection. For example, you can enumerate all of the
/// subviews and their indices to inspect or operate on them:
///
///     for (index, subview) in subviews.enumerated() {
///         // ...
///     }
///
public struct LayoutSubviews : Equatable, RandomAccessCollection {

    /// A type that contains a subsequence of proxy values.
    public typealias SubSequence = LayoutSubviews

    /// A type that contains a proxy value.
    public typealias Element = LayoutSubview

    /// A type that you can use to index proxy values.
    public typealias Index = Int

    /// A type that represents the indices that are valid for subscripting the
    /// collection, in ascending order.
    public typealias Indices = Range<LayoutSubviews.Index>

    /// A type that provides the collection's iteration interface and
    /// encapsulates its iteration state.
    ///
    /// By default, a collection conforms to the `Sequence` protocol by
    /// supplying `IndexingIterator` as its associated `Iterator`
    /// type.
    public typealias Iterator = IndexingIterator<LayoutSubviews>

    /// The layout direction inherited by the container view.
    ///
    /// SwiftUI supports both left-to-right and right-to-left directions.
    /// Read this property within a custom layout container
    /// to find out which environment the container is in.
    ///
    /// In most cases, you don't need to take any action based on this
    /// value. SwiftUI horizontally flips the x position of each view within its
    /// parent when the mode switches, so layout calculations automatically
    /// produce the desired effect for both directions.
    public var layoutDirection: LayoutDirection

    var elements: [Element] = []

    /// The index of the first subview.
    public var startIndex: Int {
        elements.startIndex
    }

    /// An index that's one higher than the last subview.
    public var endIndex: Int {
        elements.endIndex
    }

    /// Gets the subview proxy at a specified index.
    public subscript(index: Int) -> LayoutSubviews.Element { 
        elements[index]
     }

    /// Gets the subview proxies in the specified range.
    public subscript(bounds: Range<Int>) -> LayoutSubviews { 
        fatalError()
     }

    /// Gets the subview proxies with the specified indicies.
    public subscript<S>(indices: S) -> LayoutSubviews where S : Sequence, S.Element == Int { 
        fatalError()
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: LayoutSubviews, rhs: LayoutSubviews) -> Bool {
        lhs.layoutDirection == rhs.layoutDirection
    }    
}
