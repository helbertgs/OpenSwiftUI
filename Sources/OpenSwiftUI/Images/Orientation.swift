import Swift

extension Image {

    /// The orientation of an image.
    ///
    /// Many image formats such as JPEG include orientation metadata in the
    /// image data. In other cases, you can specify image orientation
    /// in code. Properly specifying orientation is often important both for
    /// displaying the image and for certain kinds of image processing.
    ///
    /// In OpenSwiftUI, you provide an orientation value when initializing an ``Image``
    @frozen public enum Orientation : UInt8, CaseIterable, Hashable {

        // MARK: - Case(s).

        /// A value that indicates the original pixel data matches the image's
        /// intended display orientation.
        case up = 0

        /// A value that indicates a horizontal flip of the image from the
        /// orientation of its original pixel data.
        case upMirrored = 2

        /// A value that indicates a 180° rotation of the image from the
        /// orientation of its original pixel data.
        case down = 6

        /// A value that indicates a vertical flip of the image from the
        /// orientation of its original pixel data.
        case downMirrored = 4

        /// A value that indicates a 90° counterclockwise rotation from the
        /// orientation of its original pixel data.
        case left = 1

        /// A value that indicates a 90° clockwise rotation and horizontal
        /// flip of the image from the orientation of its original pixel
        /// data.
        case leftMirrored = 3

        /// A value that indicates a 90° clockwise rotation of the image from
        /// the orientation of its original pixel data.
        case right = 7

        /// A value that indicates a 90° counterclockwise rotation and
        /// horizontal flip from the orientation of its original pixel data.
        case rightMirrored = 5

        // MARK: - Case Interable.

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        public typealias RawValue = UInt8

        /// A type that can represent a collection of all values of this type.
        public typealias AllCases = [Image.Orientation]

        /// A collection of all values of this type.
        public static var allCases: [Image.Orientation] {
            [ .up, .upMirrored, .down, .downMirrored, .left, .leftMirrored, .right, .rightMirrored ]
        }

        // MARK: - Constructor(s).

        /// Creates a new instance with the specified raw value.
        ///
        /// If there is no value of the type that corresponds with the specified raw
        /// value, this initializer returns `nil`. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     print(PaperSize(rawValue: "Legal"))
        ///     // Prints "Optional("PaperSize.Legal")"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init?(rawValue: UInt8) {
            switch rawValue {
            case 0: self = .up
            case 1: self = .left
            case 2: self = .upMirrored
            case 3: self = .left
            case 4: self = .downMirrored
            case 5: self = .rightMirrored
            case 6: self = .down
            case 7: self = .right
            default: return nil
            }
        }
    }
}
