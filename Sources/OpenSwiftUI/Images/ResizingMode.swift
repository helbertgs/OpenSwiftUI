import Swift

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, Windows 1, *)
extension Image {

    /// The modes that OpenSwiftUI uses to resize an image to fit within its containing view.
    public enum ResizingMode : String, Equatable, Hashable {

        // MARK: - Case(s).

        /// A mode to repeat the image at its original size, as many times as
        /// necessary to fill the available space.
        case tile

        /// A mode to enlarge or reduce the size of an image so that it fills the available space.
        case stretch

        // MARK: - Equatable.

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (lhs: Image.ResizingMode, rhs: Image.ResizingMode) -> Bool {
            lhs.rawValue == rhs.rawValue
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
            hasher.combine(rawValue)
        }
    }

    /// Sets the mode by which OpenSwiftUI resizes an image to fit its space.
    /// - Parameters:
    ///   - capInsets: Inset values that indicate a portion of the image that
    ///   OpenSwiftUI doesn't resize.
    ///   - resizingMode: The mode by which OpenSwiftUI resizes the image.
    /// - Returns: An image, with the new resizing behavior set.
    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image {
        fatalError()
    }
}
