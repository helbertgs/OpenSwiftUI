import Swift

/// An alignment in both axes.
///
/// The following table shows the various alignment guides next to each other.
///
/// ![A table showing the various alignment guides next to each
/// other.](SwiftUI-Alignment-table.png)
@frozen public struct Alignment : Equatable, Hashable {

    // MARK: - Public Property(ies).
    /// The alignment on the horizontal axis.
    public var horizontal: HorizontalAlignment

    /// The alignment on the vertical axis.
    public var vertical: VerticalAlignment

    // MARK: - Static Property(ies).
    /// A guide marking the center of the view.
    public static let center: Alignment = .init(horizontal: .center, vertical: .center)

    /// A guide marking the leading edge of the view.
    public static let leading: Alignment = .init(horizontal: .leading, vertical: .center)

    /// A guide marking the trailing edge of the view.
    public static let trailing: Alignment = .init(horizontal: .trailing, vertical: .center)

    /// A guide marking the top edge of the view.
    public static let top: Alignment = .init(horizontal: .center, vertical: .top)

    /// A guide marking the bottom edge of the view.
    public static let bottom: Alignment = .init(horizontal: .center, vertical: .bottom)

    /// A guide marking the top and leading edges of the view.
    public static let topLeading: Alignment = .init(horizontal: .leading, vertical: .top)

    /// A guide marking the top and trailing edges of the view.
    public static let topTrailing: Alignment = .init(horizontal: .trailing, vertical: .top)

    /// A guide marking the bottom and leading edges of the view.
    public static let bottomLeading: Alignment = .init(horizontal: .leading, vertical: .bottom)

    /// A guide marking the bottom and trailing edges of the view.
    public static let bottomTrailing: Alignment = .init(horizontal: .trailing, vertical: .bottom)

    // MARK: - Public Constructor(s).
    /// Creates an instance with the given horizontal and vertical alignments.
    ///
    /// - Parameters:
    ///   - horizontal: The alignment on the horizontal axis.
    ///   - vertical: The alignment on the vertical axis.
    @inlinable public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment) {
        self.horizontal = horizontal
        self.vertical = vertical
    }

    // MARK: - Hashable.
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(horizontal)
        hasher.combine(vertical)
    }

    // MARK: - Equatable.
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Alignment, rhs: Alignment) -> Bool {
        lhs.horizontal == rhs.horizontal && lhs.vertical == rhs.vertical
    }
}
