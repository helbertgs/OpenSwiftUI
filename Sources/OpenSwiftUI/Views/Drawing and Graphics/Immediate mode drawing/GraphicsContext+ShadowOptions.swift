import Foundation

extension GraphicsContext {

    /// Options that configure the graphics context filter that creates shadows.
    /// 
    /// You can use a set of these options when you call ``shadow(color:radius:x:y:blendMode:options:)`` to create a ``GraphicsContext.Filter`` that adds a drop shadow to an object that you draw into a ``GraphicsContext``.
    @frozen public struct ShadowOptions : BitwiseCopyable, Copyable, Equatable, OptionSet, Sendable {

        // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public let rawValue: Int

        // MARK: - Creating a Value

        /// Creates a new instance with the specified raw value.
        /// 
        /// - Parameter rawValue: The raw value to use for the new instance.
        @inlinable public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        /// Creates a new instance with specified.
        @inlinable public init() {
            self.rawValue = 0
        }

        // MARK: - Getting shadow options

        /// An option that causes the filter to composite the object and its shadow separately in the current layer.
        @inlinable public static var disablesGroup: GraphicsContext.ShadowOptions {
            get { Self(rawValue: 1 << 3) }
        }

        /// An option that causes the filter to invert the alpha of the shadow.
        @inlinable public static var invertsAlpha: GraphicsContext.ShadowOptions {
            get { Self(rawValue: 1 << 2) }
        }

        /// An option that causes the filter to draw the shadow above the object, rather than below it.
        @inlinable public static var shadowAbove: GraphicsContext.ShadowOptions {
            get { Self(rawValue: 1 << 0) }
        }

        /// An option that causes the filter to draw only the shadow, and omit the source object.
        @inlinable public static var shadowOnly: GraphicsContext.ShadowOptions {
            get { Self(rawValue: 1 << 1) }
        }
    }
}