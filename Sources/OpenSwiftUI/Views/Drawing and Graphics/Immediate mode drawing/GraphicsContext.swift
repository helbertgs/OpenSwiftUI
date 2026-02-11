import OpenSpatial

/// An immediate mode drawing destination, and its current state.
@frozen
public struct GraphicsContext {

    // MARK: - Drawing a path

    /// Draws a path into the context with a specified line width.
    /// 
    /// When you call this method, all ``StrokeStyle`` properties other than ``lineWidth`` take their default values. 
    /// To control other style properties, use ``stroke(_:with:style:)`` instead.
    /// - Parameters:
    ///   - path: The path to outline.
    ///   - shading: The color or pattern to use when outlining the path.
    ///   - lineWidth: The width of the stroke, which defaults to 1.
    public func stroke(_ path: Path, with shading: GraphicsContext.Shading, lineWidth: Double = 1) {
        fatalError("not implemented yet")
    }

    /// Draws a path into the context with a specified stroke style.
    /// 
    /// If you only need to control the style’s ``lineWidth`` property, use ``stroke(_:with:lineWidth:)`` instead.
    /// - Parameters:
    ///   - path: The path to outline.
    ///   - shading: The color or pattern to use when outlining the path.
    ///   - style: A style that indicates how to outline the path.
    public func stroke(_ path: Path, with shading: GraphicsContext.Shading, style: StrokeStyle) {
        fatalError("not implemented yet")
    }

    /// Draws a path into the context and fills the outlined region.
    /// 
    /// The current drawing state of the context defines the full drawing operation. 
    /// For example, the current transformation and clip shapes, and any styles applied to the result, affect the final result.
    /// - Parameters:
    ///   - path: The outline of the region to fill.
    ///   - shading: The color or pattern to use when filling the region bounded by path.
    ///   - style: A style that indicates how to rasterize the path.
    public func fill(_ path: Path, with shading: GraphicsContext.Shading, style: FillStyle = FillStyle()) {
        fatalError("not implemented yet")
    }

    // MARK: - Drawing images, text, and views

    /// Draws a resolved symbol into the context, using the specified rectangle as a layout frame.
    /// 
    /// The current context state defines the full drawing operation. 
    /// For example, the current transformation and clip shapes affect how OpenSwiftUI draws the symbol.
    /// - Parameters:
    ///   - symbol: The ``GraphicsContext.ResolvedSymbol`` to draw. Get a resolved symbol by calling ``resolveSymbol(id:)`` with the identifier that you use to tag the corresponding child view during ``Canvas`` initialization.
    ///   - rect: The rectangle in the current user space to draw the symbol in.
    public func draw(_ symbol: GraphicsContext.ResolvedSymbol, in rect: Rect3D) {
        fatalError("not implemented yet")
    }

    /// Draws resolved text into the context using the specified rectangle as a layout frame.
    /// 
    /// The current context state defines the full drawing operation. 
    /// For example, the current transformation and clip shapes affect how OpenSwiftUI draws the text.
    /// - Parameters:
    ///   - text: The GraphicsContext.ResolvedText to draw. 
    ///           Get resolved text from a Text view by calling ``resolve(_:)``. 
    ///           Alternatively, you can call ``draw(_:in:)`` with a ``Text`` view, and that method performs the resolution automatically.
    ///   - rect: The rectangle in the current user space to draw the text in.
    public func draw(_ text: GraphicsContext.ResolvedText, in rect: Rect3D) {
        fatalError("not implemented yet")
    }

    /// Draws text into the context using the specified rectangle as a layout frame.
    /// 
    /// The current context state defines the full drawing operation. 
    /// For example, the current transformation and clip shapes affect how OpenSwiftUI draws the text.
    /// - Parameters:
    ///   - text: The Text view to draw. Before drawing, the method converts the view to ``GraphicsContext.ResolvedText`` by calling ``resolve(_:)``.
    ///   - rect: The rectangle in the current user space to draw the text in.
    public func draw(_ text: Text, in rect: Rect3D) {
        fatalError("not implemented yet")
    }

    /// Draws a resolved image into the context, using the specified rectangle as a layout frame.
    /// 
    /// The current context state defines the full drawing operation. 
    /// For example, the current transformation and clip shapes affect how OpenSwiftUI draws the image.
    /// - Parameters:
    ///   - image: The GraphicsContext.ResolvedImage to draw. 
    ///            Get a resolved image from an Image by calling ``resolve(_:)``. 
    ///            Alternatively, you can call ``draw(_:in:style:)`` with an ``Image``, and that method performs the resolution automatically.
    ///   - rect: The rectangle in the current user space to draw the image in.
    ///   - style: A fill style to use when rasterizing the image.
    public func draw(_ image: GraphicsContext.ResolvedImage, in rect: Rect3D, style: FillStyle = FillStyle()) {
        fatalError("not implemented yet")
    }

    /// Draws an image into the context, using the specified rectangle as a layout frame.
    /// 
    /// The current context state defines the full drawing operation. 
    /// For example, the current transformation and clip shapes affect how OpenSwiftUI draws the image.
    /// - Parameters:
    ///   - image: The Image to draw. Before drawing, the method converts the image to a ``GraphicsContext.ResolvedImage`` by calling ``resolve(_:)``.
    ///   - rect: The rectangle in the current user space to draw the image in.
    ///   - style: A fill style to use when rasterizing the image.
    public func draw(_ image: Image, in rect: Rect3D, style: FillStyle = FillStyle()) {
        fatalError("not implemented yet")
    }

    // MARK: - Drawing into a new layer

    /// Draws a new layer, created by drawing code that you provide, into the context.
    public func drawLayer(content: (inout GraphicsContext) throws -> Void) rethrows {
        fatalError("not implemented yet")
    }

    // MARK: - Resolving a drawn entity

    /// Gets a version of an image that’s fixed with the current values of the graphics context’s environment.
    /// 
    /// You can measure the resolved image by looking at its size and baseline properties. 
    /// You can draw the resolved image with the context’s ``draw(_:in:style:)`` or ``draw(_:at:anchor:)`` method.
    /// - Parameter image: The ``Image`` to resolve.
    /// - Returns: An image that’s resolved into the current context’s environment, taking into account environment values like the display resolution and current color scheme.
    public func resolve(_ image: Image) -> GraphicsContext.ResolvedImage {
        fatalError("not implemented yet")
    }

    /// Returns a version of a shading resolved with the current values of the graphics context’s environment.
    /// 
    /// Calling this function once and then drawing multiple times with the result will often have less overhead than drawing with the original shading multiple times.
    /// - Parameter shading: 
    /// - Returns: 
    public func resolve(_ shading: GraphicsContext.Shading) -> GraphicsContext.Shading {
        fatalError("not implemented yet")
    }

    /// Gets a version of a text view that’s fixed with the current values of the graphics context’s environment.
    /// 
    /// You can measure the resolved text by calling its ``measure(in:)`` method. 
    /// You can draw the resolved text with the context’s ``draw(_:in:)`` or ``draw(_:at:anchor:)`` method.
    /// - Parameter text: The ``Text`` view to resolve.
    /// - Returns: A text view that’s resolved into the current context’s environment, taking into account environment values like the display resolution and current color scheme.
    public func resolve(_ text: Text) -> GraphicsContext.ResolvedText {
        fatalError("not implemented yet")
    }

    /// Gets the identified child view as a resolved symbol, if the view exists.
    /// 
    /// - Parameter id: The value that you used to tag the view when you define it in the symbols parameter of the ``Canvas`` initializer ``init(opaque:colorMode:rendersAsynchronously:renderer:symbols:)``.
    /// - Returns: The resolved symbol, or nil if OpenSwiftUI can’t find a child view with the given id.
    public func resolveSymbol<ID>(id: ID) -> GraphicsContext.ResolvedSymbol? where ID : Hashable {
        fatalError("not implemented yet")
    }

    // MARK: - Masking

    /// Adds a path to the context’s array of clip shapes.
    /// 
    /// Call this method to add a shape to the array of clip shapes that the context uses to define a clipping mask. 
    /// Shapes that you add affect only subsequent drawing operations.
    /// - Parameters:
    ///   - path: A ``Path`` that defines the shape of the clipping mask.
    ///   - style: A ``FillStyle`` that defines how to rasterize the shape.
    ///   - options: Clip options that tell OpenSwiftUI how to interpret the path as a clip shape. For example, you can invert the clip shape by setting the ``inverse`` option.
    public mutating func clip(to path: Path, style: FillStyle = FillStyle(), options: GraphicsContext.ClipOptions = ClipOptions()) {
        fatalError("not implemented yet")
    }

    /// Adds a clip shape that you define in a new layer to the context’s array of clip shapes.
    /// 
    /// Call this method to add a shape to the array of clip shapes that the context uses to define a clipping mask. 
    /// Shapes that you add affect only subsequent drawing operations.
    /// - Parameters:
    ///   - opacity: A value that OpenSwiftUI uses to multiply the alpha channel of the rasterized layer that you define in the content closure. The alpha values that result define the clip shape.
    ///   - options: A set of options that tell OpenSwiftUI how to interpret the clip shape. For example, you can invert the clip shape by setting the ``inverse`` option.
    ///   - content: A closure that receives as input a new ``GraphicsContext``, which represents a new transparency layer. The alpha channel of content that you draw into this context, multiplied by the opacity parameter, defines the clip shape.
    public mutating func clipToLayer(opacity: Double = 1, options: GraphicsContext.ClipOptions = ClipOptions(), content: (inout GraphicsContext) throws -> Void) rethrows {
        fatalError("not implemented yet")
    }

    /// The bounding rectangle of the intersection of all current clip shapes in the current user space.
    public private(set) var clipBoundingRect: Rect3D = .zero

    // MARK: - Setting opacity and the blend mode

    /// The opacity of drawing operations in the context.
    /// 
    /// Set this value to affect the opacity of content that you subsequently draw into the context. 
    /// Changing this value has no impact on the content you previously drew into the context.
    public var opacity: Double = 1

    /// The blend mode used by drawing operations in the context.
    /// 
    /// Set this value to affect how any content that you subsequently draw into the context blends with content that’s already in the context. 
    /// Use one of the ``GraphicsContext.BlendMode`` values.
    public var blendMode: GraphicsContext.BlendMode = .normal

    // MARK: - Filtering

    /// Adds a filter that applies to subsequent drawing operations.
    /// 
    /// To draw with filtering, OpenSwiftUI:
    /// 
    /// - Rasterizes the drawing operation to an implicit transparency layer without blending, adjusting opacity, or applying any clipping.
    /// - Applies the filter to the layer containing the rasterized image.
    /// - Composites the layer onto the background, using the context’s current blend mode, opacity setting, and clip shapes.
    /// 
    /// When OpenSwiftUI draws with a filter, the blend mode might apply to regions outside the drawing operation’s intrinsic shape, but inside its clip shape. 
    /// That might result in unexpected behavior for certain blend modes like copy, where the drawing operation completely overwrites the background even if the source alpha is zero.
    /// - Parameters:
    ///   - filter: A graphics context filter that you create by calling one of the ``GraphicsContext.Filter`` factory methods.
    ///   - options: A set of options from ``GraphicsContext.FilterOptions`` that you can use to configure filter operations.
    public mutating func addFilter(_ filter: GraphicsContext.Filter, options: GraphicsContext.FilterOptions = FilterOptions()) {
        fatalError("not implemented yet")
    }

    // MARK: - Applying transforms

    /// Scales subsequent drawing operations by an amount in each dimension.
    /// 
    /// Calling this method is equivalent to updating the context’s transform directly using the given scale factors:
    /// 
    /// ```swift
    /// transform = transform.scaledBy(x: x, y: y)
    /// ```
    /// - Parameters:
    ///   - x: The amount to scale in the horizontal direction.
    ///   - y: The amount to scale in the vertical direction.
    public mutating func scaleBy(x: Double, y: Double) {
        fatalError("not implemented yet")
    }

    /// Rotates subsequent drawing operations by an angle.
    /// 
    /// Calling this method is equivalent to updating the context’s transform directly using the angle parameter:
    /// 
    /// ```swift
    /// transform = transform.rotated(by: angle.radians)
    /// ```
    /// - Parameter angle: The amount to rotate.
    public mutating func rotate(by angle: Angle2D) {
        fatalError("not implemented yet")
    }

    /// Moves subsequent drawing operations by an amount in each dimension.
    /// 
    /// Calling this method is equivalent to updating the context’s transform directly using the given translation amount:
    ///
    /// ```swift
    /// transform = transform.translatedBy(x: x, y: y)
    /// ```
    /// - Parameters:
    ///   - x: The amount to move in the horizontal direction.
    ///   - y: The amount to move in the vertical direction.
    public mutating func translateBy(x: Double, y: Double) {
        fatalError("not implemented yet")
    }

    /// Appends the given transform to the context’s existing transform.
    /// 
    /// Calling this method is equivalent to updating the context’s transform directly using the matrix parameter:
    /// 
    /// ```swift
    /// transform = matrix.concatenating(transform)
    /// ```
    /// - Parameter matrix: A transform to append to the existing transform.
    public mutating func concatenate(_ matrix: AffineTransform3D) {
        fatalError("not implemented yet")
    }

    /// The current transform matrix, defining user space coordinates.
    /// 
    /// Modify this matrix to transform content that you subsequently draw into the context. 
    /// Changes that you make don’t affect existing content.
    public var transform: AffineTransform3D = .identity

    // MARK: - Accessing the environment
    
    /// The environment associated with the graphics context.
    /// 
    /// OpenSwiftUI initially sets this to the environment of the context’s enclosing view. 
    /// The context uses values like display resolution and the color scheme from the environment to resolve types like ``Image`` and ``Color``. 
    /// You can also access values stored in the environment for your own purposes.
    public package(set) var environment: EnvironmentValues = .init()
}