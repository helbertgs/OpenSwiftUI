import Swift

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// A type that indicates how OpenSwiftUI renders images.
    public enum TemplateRenderingMode : String, Equatable, Hashable {

        // MARK: - Case(s).

        /// A mode that renders all non-transparent pixels as the foreground
        /// color.
        case template

        /// A mode that renders pixels of bitmap images as-is.
        ///
        /// For system images created from the SF Symbol set, multicolor symbols
        /// respect the current foreground and accent colors.
        case original

        // MARK: - Equatable.

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (lhs: Image.TemplateRenderingMode, rhs: Image.TemplateRenderingMode) -> Bool {
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
}
