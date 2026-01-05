import OpenSpatial

extension GraphicsContext {

    /// A color or pattern that you can use to outline or fill a path.
    /// 
    /// Use a shading instance to describe the color or pattern of a path that you outline with a method like ``stroke(_:with:style:)``, or of the interior of a region that you fill with the ``fill(_:with:style:)`` method. 
    /// Get a shading instance by calling one of the Shading structure’s factory methods. You can base shading on:
    /// 
    /// - A ``Color``.
    /// - A ``Gradient``.
    /// - Any type that conforms to ``ShapeStyle``.
    /// - An ``Image``.
    /// - What you’ve already drawn into the context.
    /// - A collection of other shading instances.
    public struct Shading {

        // MARK: - Colors

        /// Returns a shading instance that fills with a color.
        /// 
        /// - Parameter color: A Color instance that defines the color of the shading.
        /// - Returns: A shading instance filled with a color.
        public static func color(_ color: Color) -> GraphicsContext.Shading {
            .init()
        }

        /// Returns a shading instance that fills with a color in the given color space.
        /// 
        /// - Parameters:
        ///   - colorSpace: The RGB color space used to define the color. The default is Color.RGBColorSpace.sRGB.
        ///   - red: The red component of the color.
        ///   - green: The green component of the color.
        ///   - blue: The blue component of the color.
        ///   - opacity: The opacity of the color. The default is 1, which means fully opaque.
        /// - Returns: A shading instance filled with a color.
        public static func color(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1) -> GraphicsContext.Shading {
            .init()
        }

        /// Returns a shading instance that fills with a monochrome color in the given color space.
        /// 
        /// - Parameters:
        ///   - colorSpace: The RGB color space used to define the color. The default is Color.RGBColorSpace.sRGB.
        ///   - white: The value to use for each of the red, green, and blue components of the color.
        ///   - opacity: The opacity of the color. The default is 1, which means fully opaque.
        /// - Returns: A shading instance filled with a color.
        public static func color(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) -> GraphicsContext.Shading {
            .init()
        }

        // MARK: - Gradients

        /// Returns a shading instance that fills a linear (axial) gradient.
        /// 
        /// The shading instance defines an axis from startPoint to endPoint in the current user space and maps colors from gradient to lines perpendicular to the axis.
        /// - Parameters:
        ///   - gradient: A Gradient instance that defines the colors of the gradient.
        ///   - startPoint: The start point of the gradient axis.
        ///   - endPoint: The end point of the gradient axis.
        ///   - options: Options that you use to configure the gradient.
        /// - Returns: A shading instance filled with a linear gradient.
        public static func linearGradient(_ gradient: Gradient, startPoint: Point3D, endPoint: Point3D, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            .init()
        }

        /// Returns a shading instance that fills a radial gradient.
        /// 
        /// - Parameters:
        ///   - gradient: A Gradient instance that defines the colors of the gradient.
        ///   - center: The point in the current user space on which OpenSwiftUI centers the gradient.
        ///   - startRadius: The distance from the center where the gradient starts.
        ///   - endRadius: The distance from the center where the gradient ends.
        ///   - options: Options that you use to configure the gradient.
        /// - Returns: A shading instance filled with a radial gradient.
        public static func radialGradient(_ gradient: Gradient, center: Point3D, startRadius: Double, endRadius: Double, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            .init()
        }

        /// Returns a shading instance that fills a conic (angular) gradient.
        /// 
        /// - Parameters:
        ///   - gradient: A Gradient instance that defines the colors of the gradient.
        ///   - center: The point in the current user space on which OpenSwiftUI centers the gradient.
        ///   - angle: The angle about the center that OpenSwiftUI uses to start and finish the gradient. The gradient sweeps all the way around the center.
        ///   - options: Options that you use to configure the gradient.
        /// - Returns: A shading instance filled with a conic gradient.
        public static func conicGradient(_ gradient: Gradient, center: Point3D, angle: Angle2D = .init(), options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            .init()
        }

        // MARK: - Other shape styles

        /// Returns a shading instance that fills with the given shape style.
        /// 
        /// Styles with geometry defined in a unit coordinate space map that space to the rectangle associated with the drawn object. 
        /// You can adjust that using the ``in(_:)`` method. 
        /// The shape style might affect the blend mode and opacity of the drawn object.
        /// - Parameter style: A ``ShapeStyle`` instance to draw with.
        /// - Returns: A shading instance filled with a shape style.
        public static func style<S>(_ style: S) -> GraphicsContext.Shading where S : ShapeStyle {
            .init()
        }

        /// A shading instance that fills with the foreground style from the graphics context’s environment.
        public static var foreground: GraphicsContext.Shading {
            .init()
        }

        // MARK: - Images

        /// Returns a shading instance that tiles an image across the infinite plane.
        /// 
        /// - Parameters:
        ///   - image: An Image to use as fill.
        ///   - origin: The point in the current user space where OpenSwiftUI places the bottom left corner of the part of the image defined by sourceRect. The image repeats as needed.
        ///   - sourceRect: A unit space subregion of the image. The default is a unit rectangle, which selects the whole image.
        ///   - scale: A factor that you can use to control the image size.
        /// - Returns: A shading instance filled with a tiled image.
        public static func tiledImage(_ image: Image, origin: Point3D = .zero, sourceRect: Rect3D = Rect3D(center: .zero, size: .one), scale: Double = 1) -> GraphicsContext.Shading {
            .init()
        }

        // MARK: - Composite shading types

        /// Returns a multilevel shading instance constructed from an array of shading instances.
        /// 
        /// 
        /// - Parameter array: An array of shading instances. The array must contain at least one element.
        /// - Returns: A shading instance composed from the given instances.
        public static func palette(_ array: [GraphicsContext.Shading]) -> GraphicsContext.Shading {
            .init()
        }

        /// A shading instance that draws a copy of the current background.
        public static var backdrop: GraphicsContext.Shading {
            .init()
        }

        // MARK: - Using a custom OpenGL shader

        /// Returns a shading instance that fills with the results of querying a shader for each pixel.
        /// 
        /// 
        /// - Parameters:
        ///   - shader: The shader defining the filled colors.
        ///   - bounds: The rect used to define any bounds arguments of the shader.
        /// - Returns: A shading instance that fills using the shader.
        public static func shader(_ shader: Shader, bounds: Rect3D = .zero) -> GraphicsContext.Shading {
            .init()
        }

        // MARK: - Type Methods

        /// Returns a shading instance that fills with a mesh gradient.
        /// 
        /// - Parameter mesh: The mesh gradient defining the filled colors.
        /// - Returns: A shading that fills using the mesh gradient.
        public static func meshGradient(_ mesh: MeshGradient) -> GraphicsContext.Shading {
            .init()
        }
    }
}