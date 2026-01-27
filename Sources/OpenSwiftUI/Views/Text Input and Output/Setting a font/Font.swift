import Foundation

public struct Font : Equatable, Sendable {
}

extension Font {
    public struct Weight : Equatable, Sendable {
    }
}

extension Font {
    
    /// A width to use for fonts that have multiple widths.
    public struct Width : Equatable, Hashable, Sendable {

        // MARK: - Checking Characteristics.

        /// A value to use for the width.
        public let value: Double

        /// Creates a width with the given value.
        /// 
        /// - Parameter value: The value to use for the width.
        init(_ value: Double) {
            self.value = value
        }

        /// The compressed width.
        public static let compressed = Font.Width(-0.3)

        /// The condensed width.
        public static let condensed = Font.Width(-0.2)

        /// The standard width.
        public static let standard = Font.Width(0.0)

        /// The expanded width.
        public static let expanded = Font.Width(0.2)
    }
}

extension Font {
    public struct Design : Equatable, Sendable {
    }
}