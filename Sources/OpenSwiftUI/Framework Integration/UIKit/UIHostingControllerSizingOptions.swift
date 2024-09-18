#if os(iOS) || canImport(UIKit)

/// Options for how a hosting controller tracks its content's size.
public struct UIHostingControllerSizingOptions : OptionSet {

    // MARK: - Type Alias.

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = UIHostingControllerSizingOptions

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = UIHostingControllerSizingOptions

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int

    // MARK: - Property(ies).

    /// The raw value.
    public let rawValue: Int

    // MARK: - Static Property(ies).

    /// The hosting controller tracks its content's ideal size in its
    /// preferred content size.
    ///
    /// Use this option when using a hosting controller with a container view
    /// controller that requires up-to-date knowledge of the hosting
    /// controller's ideal size.
    ///
    /// - Note: This option comes with a performance cost because it
    ///   asks for the ideal size of the content using the
    ///   ``ProposedViewSize/unspecified`` size proposal.
    public static var preferredContentSize: UIHostingControllerSizingOptions {
        .init(rawValue: 0)
    }

    /// The hosting controller's view automatically invalidate its intrinsic
    /// content size when its ideal size changes.
    ///
    /// Use this option when the hosting controller's view is being laid out
    /// with Auto Layout.
    ///
    /// - Note: This option comes with a performance cost because it
    ///   asks for the ideal size of the content using the
    ///   ``ProposedViewSize/unspecified`` size proposal.
    public static var intrinsicContentSize: UIHostingControllerSizingOptions {
        .init(rawValue: 0)
    }

    // MARK: - Constructor(s).

    /// Creates a new option set from a raw value.
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

#endif
