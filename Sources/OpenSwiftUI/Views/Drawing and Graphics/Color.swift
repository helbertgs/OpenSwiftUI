import Swift

/// A representation of a color that adapts to a given context.
///
/// You can create a color in one of several ways:
///
/// * Load a color from an Asset Catalog:
///     ```
///     let aqua = Color("aqua") // Looks in your app's main bundle by default.
///     ```
/// * Specify component values, like red, green, and blue; hue,
///   saturation, and brightness; or white level:
///     ```
///     let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
///     let lemonYellow = Color(hue: 0.1639, saturation: 1, brightness: 1)
///     let steelGray = Color(white: 0.4745)
///     ```
/// * Create a color instance from another color, like a
///   <doc://com.apple.documentation/documentation/UIKit/UIColor> or an
///   <doc://com.apple.documentation/documentation/AppKit/NSColor>:
///     ```
///     #if os(iOS)
///     let linkColor = Color(uiColor: .link)
///     #elseif os(macOS)
///     let linkColor = Color(nsColor: .linkColor)
///     #endif
///     ```
/// * Use one of a palette of predefined colors, like ``ShapeStyle/black``,
///   ``ShapeStyle/green``, and ``ShapeStyle/purple``.
///
/// Some view modifiers can take a color as an argument. For example,
/// ``View/foregroundStyle(_:)`` uses the color you provide to set the
/// foreground color for view elements, like text or
/// [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/):
///
///     Image(systemName: "leaf.fill")
///         .foregroundStyle(Color.green)
///
/// ![A screenshot of a green leaf.](Color-1)
///
/// Because OpenSwiftUI treats colors as ``View`` instances, you can also
/// directly add them to a view hierarchy. For example, you can layer
/// a rectangle beneath a sun image using colors defined above:
///
///     ZStack {
///         skyBlue
///         Image(systemName: "sun.max.fill")
///             .foregroundStyle(lemonYellow)
///     }
///     .frame(width: 200, height: 100)
///
/// A color used as a view expands to fill all the space it's given,
/// as defined by the frame of the enclosing ``ZStack`` in the above example:
///
/// ![A screenshot of a yellow sun on a blue background.](Color-2)
///
/// OpenSwiftUI only resolves a color to a concrete value
/// just before using it in a given environment.
/// This enables a context-dependent appearance for
/// system defined colors, or those that you load from an Asset Catalog.
/// For example, a color can have distinct light and dark variants
/// that the system chooses from at render time.
public struct Color: CustomStringConvertible, Equatable, Hashable {

    // MARK: - Type Alias.

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    // MARK: - Private Property(ies).

    private let provider: ColorBox<AnyColorBox>

    // MARK: - Static Property(ies).

    /// A color that reflects the accent color of the system or app.
    ///
    /// The accent color is a broad theme color applied to
    /// views and controls. You can set it at the application level by specifying
    /// an accent color in your app's asset catalog.
    ///
    /// > Note: In macOS, OpenSwiftUI applies customization of the accent color
    /// only if the user chooses Multicolor under General > Accent color
    /// in System Preferences.
    ///
    /// The following code renders a ``Text`` view using the app's accent color:
    ///
    ///     Text("Accent Color")
    ///         .foregroundStyle(Color.accentColor)
    ///
    public static var accentColor: Color = .init(red: 0, green: 0, blue: 0)

    /// A context-dependent red color suitable for use in UI elements.
    public static let red: Color = .init(red: 1, green: 0, blue: 0)

    /// A context-dependent orange color suitable for use in UI elements.
    public static let orange: Color = .init(red: 0, green: 0, blue: 0)

    /// A context-dependent yellow color suitable for use in UI elements.
    public static let yellow: Color = .init(red: 0, green: 0, blue: 0)

    /// A context-dependent green color suitable for use in UI elements.
    public static let green: Color = .init(red: 0, green: 1, blue: 0)

    /// A context-dependent mint color suitable for use in UI elements.
    public static let mint: Color = .init(red: 0, green: 0, blue: 0)

    /// A context-dependent teal color suitable for use in UI elements.
    public static let teal: Color = .init(red: 0, green: 0, blue: 0)

    /// A context-dependent cyan color suitable for use in UI elements.
    public static let cyan: Color = .init(red: 0, green: 0, blue: 0)

    /// A context-dependent blue color suitable for use in UI elements.
    public static let blue: Color = .init(red: 0, green: 0, blue: 1)

    /// A context-dependent indigo color suitable for use in UI elements.
    public static let indigo: Color = .init(red: 0, green: 0, blue: 0)

    /// A context-dependent purple color suitable for use in UI elements.
    public static let purple: Color = .init(red: 0, green: 0, blue: 0)

    /// A context-dependent pink color suitable for use in UI elements.
    public static let pink: Color = .init(red: 0, green: 0, blue: 0)

    /// A context-dependent brown color suitable for use in UI elements.
    public static let brown: Color = .init(red: 0, green: 0, blue: 0)

    /// A white color suitable for use in UI elements.
    public static let white: Color = .init(red: 1, green: 1, blue: 1)

    /// A context-dependent gray color suitable for use in UI elements.
    public static let gray: Color = .init(red: 0.5, green: 0.5, blue: 0.5)

    /// A black color suitable for use in UI elements.
    public static let black: Color = .init(red: 0, green: 0, blue: 0)

    /// A clear color suitable for use in UI elements.
    public static let clear: Color = .init(red: 0, green: 0, blue: 0, opacity: 0)

    /// The color to use for primary content.
    public static let primary: Color = .init(red: 0, green: 0, blue: 0)

    /// The color to use for secondary content.
    public static let secondary: Color = .init(red: 0, green: 0, blue: 0)

    // MARK: - Public Constructor(s).

    /// Creates a constant color from red, green, and blue component values.
    ///
    /// This initializer creates a constant color that doesn't change based
    /// on context. For example, it doesn't have distinct light and dark
    /// appearances, unlike various system-defined colors, or a color that
    /// you load from an Asset Catalog with ``init(_:bundle:)``.
    ///
    /// A standard sRGB color space clamps each color component — `red`,
    /// `green`, and `blue` — to a range of `0` to `1`, but OpenSwiftUI colors
    /// use an extended sRGB color space, so
    /// you can use component values outside that range. This makes it
    /// possible to create colors using the ``RGBColorSpace/sRGB`` or
    /// ``RGBColorSpace/sRGBLinear`` color space that make full use of the wider
    /// gamut of a diplay that supports ``RGBColorSpace/displayP3``.
    ///
    /// - Parameters:
    ///   - colorSpace: The profile that specifies how to interpret the color
    ///     for display. The default is ``RGBColorSpace/sRGB``.
    ///   - red: The amount of red in the color.
    ///   - green: The amount of green in the color.
    ///   - blue: The amount of blue in the color.
    ///   - opacity: An optional degree of opacity, given in the range `0` to
    ///     `1`. A value of `0` means 100% transparency, while a value of `1`
    ///     means 100% opacity. The default is `1`.
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1) {
        switch colorSpace {
            case .sRGB:
                provider = .init(Resolved(linearRed: red, linearGreen: green, linearBlue: blue, opacity: opacity))
            case .sRGBLinear:
                provider = .init(Resolved(linearRed: red, linearGreen: green, linearBlue: blue, opacity: opacity))
            case .displayP3:
                provider = .init(DisplayP3(red: red, green: green, blue: blue, opacity: opacity))
        }
    }

    /// Creates a constant grayscale color.
    ///
    /// This initializer creates a constant color that doesn't change based
    /// on context. For example, it doesn't have distinct light and dark
    /// appearances, unlike various system-defined colors, or a color that
    /// you load from an Asset Catalog with ``init(_:bundle:)``.
    ///
    /// A standard sRGB color space clamps the `white` component
    /// to a range of `0` to `1`, but OpenSwiftUI colors
    /// use an extended sRGB color space, so
    /// you can use component values outside that range. This makes it
    /// possible to create colors using the ``RGBColorSpace/sRGB`` or
    /// ``RGBColorSpace/sRGBLinear`` color space that make full use of the wider
    /// gamut of a diplay that supports ``RGBColorSpace/displayP3``.
    ///
    /// - Parameters:
    ///   - colorSpace: The profile that specifies how to interpret the color
    ///     for display. The default is ``RGBColorSpace/sRGB``.
    ///   - white: A value that indicates how white
    ///     the color is, with higher values closer to 100% white, and lower
    ///     values closer to 100% black.
    ///   - opacity: An optional degree of opacity, given in the range `0` to
    ///     `1`. A value of `0` means 100% transparency, while a value of `1`
    ///     means 100% opacity. The default is `1`.
    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) {
        provider = .init(Resolved(linearRed: white, linearGreen: white, linearBlue: white, opacity: opacity))
    }

    /// Creates a constant color from hue, saturation, and brightness values.
    ///
    /// This initializer creates a constant color that doesn't change based
    /// on context. For example, it doesn't have distinct light and dark
    /// appearances, unlike various system-defined colors, or a color that
    /// you load from an Asset Catalog with ``init(_:bundle:)``.
    ///
    /// - Parameters:
    ///   - hue: A value in the range `0` to `1` that maps to an angle
    ///     from 0° to 360° to represent a shade on the color wheel.
    ///   - saturation: A value in the range `0` to `1` that indicates
    ///     how strongly the hue affects the color. A value of `0` removes the
    ///     effect of the hue, resulting in gray. As the value increases,
    ///     the hue becomes more prominent.
    ///   - brightness: A value in the range `0` to `1` that indicates
    ///     how bright a color is. A value of `0` results in black, regardless
    ///     of the other components. The color lightens as you increase this
    ///     component.
    ///   - opacity: An optional degree of opacity, given in the range `0` to
    ///     `1`. A value of `0` means 100% transparency, while a value of `1`
    ///     means 100% opacity. The default is `1`.
    public init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1) {
        provider = .init(Resolved(linearRed: 0, linearGreen: 0, linearBlue: 0, opacity: opacity))
    }

    // MARK: - Public Function(s).
    /// Multiplies the opacity of the color by the given amount.
    ///
    /// - Parameter opacity: The amount by which to multiply the opacity of the
    ///   color.
    /// - Returns: A view with modified opacity.
    public func opacity(_ opacity: Double) -> Color {
        guard let color = provider.base as? Resolved else { return self }
        return Color(.sRGB, red: color.linearRed, green: color.linearGreen, blue: color.linearBlue, opacity: color.opacity * opacity)
    }

    // MARK: - Hashable.

    /// Hashes the essential components of the color by feeding them into the
    /// given hash function.
    ///
    /// - Parameters:
    ///   - hasher: The hash function to use when combining the components of
    ///     the color.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(provider.base)
    }

    // MARK: - Equatable.

    /// Indicates whether two colors are equal.
    ///
    /// - Parameters:
    ///   - lhs: The first color to compare.
    ///   - rhs: The second color to compare.
    /// - Returns: A Boolean that's set to `true` if the two colors are equal.
    public static func == (lhs: Color, rhs: Color) -> Bool {
        ObjectIdentifier(lhs.provider) == ObjectIdentifier(rhs.provider)
    }

    // MARK: - Custom String Convertible
    /// A textual representation of the color.
    ///
    /// Use this method to get a string that represents the color.
    /// The <doc://com.apple.documentation/documentation/Swift/1541053-print>
    /// function uses this property to get a string representing an instance:
    ///
    ///     print(Color.red)
    ///     // Prints "red"
    public var description: String { "\(self)" }
}

extension Color {

    /// A profile that specifies how to interpret a color value for display.
    public enum RGBColorSpace: Equatable, Hashable {

        // MARK: - Case(s).
        /// The extended red, green, blue (sRGB) color space.
        ///
        /// For information about the sRGB colorimetry and nonlinear
        /// transform function, see the IEC 61966-2-1 specification.
        ///
        /// Standard sRGB color spaces clamp the red, green, and blue
        /// components of a color to a range of `0` to `1`, but OpenSwiftUI colors
        /// use an extended sRGB color space, so you can use component values
        /// outside that range.
        case sRGB

        /// The extended sRGB color space with a linear transfer function.
        ///
        /// This color space has the same colorimetry as ``sRGB``, but uses
        /// a linear transfer function.
        ///
        /// Standard sRGB color spaces clamp the red, green, and blue
        /// components of a color to a range of `0` to `1`, but OpenSwiftUI colors
        /// use an extended sRGB color space, so you can use component values
        /// outside that range.
        case sRGBLinear

        /// The Display P3 color space.
        ///
        /// This color space uses the Digital Cinema Initiatives - Protocol 3
        /// (DCI-P3) primary colors, a D65 white point, and the ``sRGB``
        /// transfer function.
        case displayP3

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
            hasher = .init()
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
        public static func == (lhs: Color.RGBColorSpace, rhs: Color.RGBColorSpace) -> Bool {
            switch (lhs, rhs) {
                case (.sRGB, .sRGB): return true
                case (.sRGBLinear, .sRGBLinear): return true
                case (.displayP3, .displayP3): return true
                default: return false
            }
        }
    }
}

extension Color {
    class AnyColorBox : Equatable, Hashable {

        // MARK: - Hashable.
        /// Hashes the essential components of the color by feeding them into the
        /// given hash function.
        ///
        /// - Parameters:
        ///   - hasher: The hash function to use when combining the components of
        ///     the color.
        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(Self.self).hashValue)
        }

        // MARK: - Equatable.
        /// Indicates whether two colors are equal.
        ///
        /// - Parameters:
        ///   - lhs: The first color to compare.
        ///   - rhs: The second color to compare.
        /// - Returns: A Boolean that's set to `true` if the two colors are equal.
        static func == (lhs: Color.AnyColorBox, rhs: Color.AnyColorBox) -> Bool {
            ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
        }
    }
}

extension Color {
    class ColorBox<T> where T : AnyColorBox {
        var base: T
        init(_ base: T) { self.base = base }
    }
}

extension Color {

    /// The Display P3 color space.
    ///
    /// This color space uses the Digital Cinema Initiatives - Protocol 3
    /// (DCI-P3) primary colors, a D65 white point, and the ``sRGB``
    /// transfer function.
    class DisplayP3: AnyColorBox {

        // MARK: - Public Property(ies).
        /// The amount of red in the color.
        let red: Double

        /// The amount of green in the color.
        let green: Double

        /// The amount of blue in the color.
        let blue: Double

        /// An optional degree of opacity, given in the range 0 to 1. A value of 0 means 100% transparency, while a value of 1 means 100% opacity. The default is 1.
        let opacity: Double

        // MARK: - Constructor(s).
        /// Creates a constant color from red, green, blue, and opacity component values.
        /// - Parameters:
        ///   - red: The amount of red in the color.
        ///   - green: The amount of green in the color.
        ///   - blue: The amount of blue in the color.
        ///   - opacity: An optional degree of opacity, given in the range 0 to 1. A value of 0 means 100% transparency, while a value of 1 means 100% opacity. The default is 1.
        init(red: Double, green: Double, blue: Double, opacity: Double) {
            self.red = red
            self.green = green
            self.blue = blue
            self.opacity = opacity
        }
    }
}

extension Color {

    /// The extended red, green, blue (sRGB) color space.
    ///
    /// Standard sRGB color spaces clamp the red, green, and blue
    /// components of a color to a range of `0` to `1`, but OpenSwiftUI colors
    /// use an extended sRGB color space, so you can use component values
    /// outside that range.
    class Resolved: AnyColorBox, CustomStringConvertible {

        // MARK: - Public Property(ies).

        /// The amount of red in the color.
        let linearRed: Double

        /// The amount of green in the color.
        let linearGreen: Double

        /// The amount of blue in the color.
        let linearBlue: Double

        /// An optional degree of opacity, given in the range 0 to 1. A value of 0 means 100% transparency, while a value of 1 means 100% opacity. The default is 1.
        let opacity: Double

        // MARK: - Constructor(s).

        /// Creates a constant color from red, green, blue, and opacity component values.
        /// - Parameters:
        ///   - linearRed: The amount of red in the color.
        ///   - linearGreen: The amount of green in the color.
        ///   - linearBlue: The amount of blue in the color.
        ///   - opacity: An optional degree of opacity, given in the range 0 to 1. A value of 0 means 100% transparency, while a value of 1 means 100% opacity. The default is 1.
        init(linearRed: Double, linearGreen: Double, linearBlue: Double, opacity: Double) {
            self.linearRed = linearRed
            self.linearGreen = linearGreen
            self.linearBlue = linearBlue
            self.opacity = opacity
        }

        var description: String {
            "#FFFFFFFF"
        }
    }
}
