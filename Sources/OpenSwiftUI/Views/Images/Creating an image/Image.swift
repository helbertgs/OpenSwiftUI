//
// Image.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenSpatial

/// A view that displays an image.
///
/// Use an `Image` instance when you want to add images to your OpenSwiftUI app.
/// You can create images from many sources:
///
/// * Image files in your app's asset library or bundle. Supported types include
/// PNG, JPEG, HEIC, and more.
/// * Instances of platform-specific image types, like
/// <doc://com.apple.documentation/documentation/UIKit/UIImage> and
/// <doc://com.apple.documentation/documentation/AppKit/NSImage>.
/// * A bitmap stored in a Core Graphics
///  <doc://com.apple.documentation/documentation/coregraphics/cgimage>
///  instance.
/// * System graphics from the SF Symbols set.
///
/// The following example shows how to load an image from the app's asset
/// library or bundle and scale it to fit within its container:
///
///     Image("Landscape_4")
///         .resizable()
///         .aspectRatio(contentMode: .fit)
///     Text("Water wheel")
///
/// ![An image of a water wheel and its adjoining building, resized to fit the
/// width of an iPhone display. The words Water wheel appear under this
/// image.](Image-1.png)
///
/// You can use methods on the `Image` type as well as
/// standard view modifiers to adjust the size of the image to fit your app's
/// interface. Here, the `Image` type's
/// ``Image/resizable(capInsets:resizingMode:)`` method scales the image to fit
/// the current view. Then, the
/// ``View/aspectRatio(_:contentMode:)`` view modifier adjusts
/// this resizing behavior to maintain the image's original aspect ratio, rather
/// than scaling the x- and y-axes independently to fill all four sides of the
/// view. The article
/// <doc:Fitting-Images-into-Available-Space> shows how to apply scaling,
/// clipping, and tiling to `Image` instances of different sizes.
///
/// An `Image` is a late-binding token; the system resolves its actual value
/// only when it's about to use the image in an environment.
///
/// ### Making images accessible
///
/// To use an image as a control, use one of the initializers that takes a
/// `label` parameter. This allows the system's accessibility frameworks to use
/// the label as the name of the control for users who use features like
/// VoiceOver. For images that are only present for aesthetic reasons, use an
/// initializer with the `decorative` parameter; the accessibility systems
/// ignore these images.
@frozen public struct Image : Sendable {

    // MARK: - Checking Characteristics.


    /// The provider of the image.
    var provider: AnyImageProviderBox

    /// Initializes an image with a provider.
    /// 
    /// - Parameter provider: The provider of the image.
    init(provider: AnyImageProviderBox) {
        self.provider = provider
    }
}

extension Image {

    /// Sets the mode by which OpenSwiftUI resizes an image to fit its space.
    /// - Parameters:
    ///   - capInsets: Inset values that indicate a portion of the image that
    ///   OpenSwiftUI doesn't resize.
    ///   - resizingMode: The mode by which OpenSwiftUI resizes the image.
    /// - Returns: An image, with the new resizing behavior set.
    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image {
        Image(
            provider: ImageProviderBox(
                provider: ResizableProvider(
                    base: provider, 
                    capInsets: capInsets, 
                    resizingMode: resizingMode
                )
            )
        )
    }
}

extension Image {

    /// Specifies the current level of quality for rendering an
    /// image that requires interpolation.
    ///
    /// See the article <doc:Fitting-Images-into-Available-Space> for examples
    /// of using `interpolation(_:)` when scaling an ``Image``.
    /// - Parameter interpolation: The quality level, expressed as a value of
    /// the `Interpolation` type, that OpenSwiftUI applies when interpolating
    /// an image.
    /// - Returns: An image with the given interpolation value set.
    public func interpolation(_ interpolation: Image.Interpolation) -> Image {
        Image(
            provider: ImageProviderBox(
                provider: InterpolationProvider(
                    base: provider, 
                    interpolation: interpolation
                )
            )
        )
    }

    /// Specifies whether OpenSwiftUI applies antialiasing when rendering
    /// the image.
    /// - Parameter isAntialiased: A Boolean value that specifies whether to
    /// allow antialiasing. Pass `true` to allow antialising, `false` otherwise.
    /// - Returns: An image with the antialiasing behavior set.
    public func antialiased(_ isAntialiased: Bool) -> Image {
        Image(
            provider: ImageProviderBox(
                provider: AntialiasedProvider(
                    base: provider, 
                    isAntialiased: isAntialiased
                )
            )
        )
    }
}

extension Image {

    /// Sets the rendering mode for symbol images within this view.
    ///
    /// - Parameter mode: The symbol rendering mode to use.
    ///
    /// - Returns: A view that uses the rendering mode you supply.
    public func symbolRenderingMode(_ mode: SymbolRenderingMode?) -> Image {
        Image(
            provider: ImageProviderBox(
                provider: SymbolRenderingModeProvider(
                    base: provider, 
                    mode: mode
                )
            )
        )
    }
}

extension Image {

    /// Sets the variable value mode mode for symbol images within this view.
    ///
    /// - Parameter mode: The symbol variable value mode to use.
    ///
    /// - Returns: A view that uses the symbol variable value mode you supply.
    public func symbolVariableValueMode(_ mode: SymbolVariableValueMode?) -> Image {
        Image(
            provider: ImageProviderBox(
                provider: SymbolVariableValueModeProvider(
                    base: provider, 
                    mode: mode
                )
            )
        )
    }
}

extension Image {

    /// Sets the color rendering mode of the image.
    ///
    /// - Parameter mode: The color rendering mode, or nil to use the
    ///   default mode.
    ///
    /// - Returns: A view that specifies how to fill symbol images.
    public func symbolColorRenderingMode(_ mode: SymbolColorRenderingMode?) -> Image {
        Image(
            provider: ImageProviderBox(
                provider: SymbolColorRenderingModeProvider(
                    base: provider, 
                    mode: mode
                )
            )
        )
    }
}

extension Image {

    /// Indicates whether OpenSwiftUI renders an image as-is, or
    /// by using a different mode.
    ///
    /// The ``TemplateRenderingMode`` enumeration has two cases:
    /// ``TemplateRenderingMode/original`` and ``TemplateRenderingMode/template``.
    /// The original mode renders pixels as they appear in the original source
    /// image. Template mode renders all nontransparent pixels as the
    /// foreground color, which you can use for purposes like creating image
    /// masks.
    ///
    /// The following example shows both rendering modes, as applied to an icon
    /// image of a green circle with darker green border:
    ///
    ///     Image("dot_green")
    ///         .renderingMode(.original)
    ///     Image("dot_green")
    ///         .renderingMode(.template)
    ///
    /// ![Two identically-sized circle images. The circle on top is green
    /// with a darker green border. The circle at the bottom is a solid color,
    /// either white on a black background, or black on a white background,
    /// depending on the system's current dark mode
    /// setting.](OpenSwiftUI-Image-TemplateRenderingMode-dots.png)
    ///
    /// You also use `renderingMode` to produce multicolored system graphics
    /// from the SF Symbols set. Use the ``TemplateRenderingMode/original``
    /// mode to apply a foreground color to all parts of the symbol except
    /// those that have a distinct color in the graphic. The following
    /// example shows three uses of the `person.crop.circle.badge.plus` symbol
    /// to achieve different effects:
    ///
    /// * A default appearance with no foreground color or template rendering
    /// mode specified. The symbol appears all black in light mode, and all
    /// white in Dark Mode.
    /// * The multicolor behavior achieved by using `original` template
    /// rendering mode, along with a blue foreground color. This mode causes the
    /// graphic to override the foreground color for distinctive parts of the
    /// image, in this case the plus icon.
    /// * A single-color template behavior achieved by using `template`
    /// rendering mode with a blue foreground color. This mode applies the
    /// foreground color to the entire image, regardless of the user's Appearance preferences.
    ///
    ///```swift
    ///HStack {
    ///    Image(systemName: "person.crop.circle.badge.plus")
    ///    Image(systemName: "person.crop.circle.badge.plus")
    ///        .renderingMode(.original)
    ///        .foregroundColor(.blue)
    ///    Image(systemName: "person.crop.circle.badge.plus")
    ///        .renderingMode(.template)
    ///        .foregroundColor(.blue)
    ///}
    ///.font(.largeTitle)
    ///```
    ///
    /// ![A horizontal layout of three versions of the same symbol: a person
    /// icon in a circle with a plus icon overlaid at the bottom left. Each
    /// applies a diffent set of colors based on its rendering mode, as
    /// described in the preceding
    /// list.](OpenSwiftUI-Image-TemplateRenderingMode-sfsymbols.png)
    ///
    /// Use the SF Symbols app to find system images that offer the multicolor
    /// feature. Keep in mind that some multicolor symbols use both the
    /// foreground and accent colors.
    ///
    /// - Parameter renderingMode: The mode OpenSwiftUI uses to render images.
    /// - Returns: A modified ``Image``.
    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image {
        Image(
            provider: ImageProviderBox(
                provider: RenderingModeProvider(
                    base: provider, 
                    mode: renderingMode
                )
            )
        )
    }
}

extension Image {

    /// Creates a labeled image that you can use as content for controls.
    ///
    /// - Parameters:
    ///   - name: The name of the image resource to lookup, as well as the
    ///     localization key with which to label the image.
    ///   - bundle: The bundle to search for the image resource and localization
    ///     content. If `nil`, OpenSwiftUI uses the main `Bundle`. Defaults to `nil`.
    public init(_ name: String, bundle: Bundle? = nil) {
        self.provider = ImageProviderBox(
            provider: NamedImageProvider(
                name: name, 
                location: .bundle(bundle ?? .main)
            )
        )
    }

    /// Creates a labeled image that you can use as content for controls, with
    /// the specified label.
    ///
    /// - Parameters:
    ///   - name: The name of the image resource to lookup
    ///   - bundle: The bundle to search for the image resource. If `nil`,
    ///     OpenSwiftUI uses the main `Bundle`. Defaults to `nil`.
    ///   - label: The label associated with the image. OpenSwiftUI uses the label
    ///     for accessibility.
    public init(_ name: String, bundle: Bundle? = nil, label: Text) {
        self.provider = ImageProviderBox(
            provider: NamedImageProvider(
                name: name, 
                label: label,
                location: .bundle(bundle ?? .main)
            )
        )
    }

    /// Creates an unlabeled, decorative image.
    ///
    /// OpenSwiftUI ignores this image for accessibility purposes.
    ///
    /// - Parameters:
    ///   - name: The name of the image resource to lookup
    ///   - bundle: The bundle to search for the image resource. If `nil`,
    ///     OpenSwiftUI uses the main `Bundle`. Defaults to `nil`.
    public init(decorative name: String, bundle: Bundle? = nil) {
        self.provider = ImageProviderBox(
            provider: NamedImageProvider(
                name: name, 
                location: .bundle(bundle ?? .main),
                decorative: true
            )
        )
    }

    /// Creates a system symbol image.
    ///
    /// This initializer creates an image using a system-provided symbol. Use
    /// [SF Symbols](https://developer.apple.com/design/resources/#sf-symbols)
    /// to find symbols and their corresponding names.
    ///
    /// To create a custom symbol image from your app's asset catalog, use
    /// ``Image/init(_:bundle:)`` instead.
    ///
    /// - Parameters:
    ///   - systemName: The name of the system symbol image.
    ///     Use the SF Symbols app to look up the names of system symbol images.
    public init(systemName: String) {
        self.provider = ImageProviderBox(
            provider: NamedImageProvider(
                name: systemName, 
                location: .system
            )
        )
    }
}

extension Image {

    /// Creates a system symbol image with a variable value.
    ///
    /// This initializer creates an image using a system-provided symbol. The
    /// rendered symbol may alter its appearance to represent the value
    /// provided in `variableValue`. Use
    /// [SF Symbols](https://developer.apple.com/design/resources/#sf-symbols)
    /// (version 4.0 or later) to find system symbols that support variable
    /// values and their corresponding names.
    ///
    /// The following example shows the effect of creating the `"chart.bar.fill"`
    /// symbol with different values.
    ///
    ///     HStack{
    ///         Image(systemName: "chart.bar.fill", variableValue: 0.3)
    ///         Image(systemName: "chart.bar.fill", variableValue: 0.6)
    ///         Image(systemName: "chart.bar.fill", variableValue: 1.0)
    ///     }
    ///     .font(.system(.largeTitle))
    ///
    /// ![Three instances of the bar chart symbol, arranged horizontally.
    /// The first fills one bar, the second fills two bars, and the last
    /// symbol fills all three bars.](Image-3)
    ///
    /// To create a custom symbol image from your app's asset
    /// catalog, use ``Image/init(_:variableValue:bundle:)`` instead.
    ///
    /// - Parameters:
    ///   - systemName: The name of the system symbol image.
    ///     Use the SF Symbols app to look up the names of system
    ///     symbol images.
    ///   - variableValue: An optional value between `0.0` and `1.0` that
    ///     the rendered image can use to customize its appearance, if
    ///     specified. If the symbol doesn't support variable values, this
    ///     parameter has no effect. Use the SF Symbols app to look up which
    ///     symbols support variable values.
    public init(systemName: String, variableValue: Double?) {
        self.provider = ImageProviderBox(
            provider: NamedImageProvider(
                name: systemName, 
                value: variableValue,
                location: .system
            )
        )
    }

    /// Creates a labeled image that you can use as content for controls,
    /// with a variable value.
    ///
    /// This initializer creates an image using a using a symbol in the
    /// specified bundle. The rendered symbol may alter its appearance to
    /// represent the value provided in `variableValue`.
    ///
    /// > Note: See WWDC22 session [10158: Adopt variable color in SF
    /// Symbols](https://developer.apple.com/wwdc22/10158/) for details
    /// on how to create symbols that support variable values.
    ///
    /// - Parameters:
    ///   - name: The name of the image resource to lookup, as well as
    ///     the localization key with which to label the image.
    ///   - variableValue: An optional value between `0.0` and `1.0` that
    ///     the rendered image can use to customize its appearance, if
    ///     specified. If the symbol doesn't support variable values, this
    ///     parameter has no effect.
    ///   - bundle: The bundle to search for the image resource and
    ///     localization content. If `nil`, OpenSwiftUI uses the main
    ///     `Bundle`. Defaults to `nil`.
    ///
    public init(_ name: String, variableValue: Double?, bundle: Bundle? = nil) {
        self.provider = ImageProviderBox(
            provider: NamedImageProvider(
                name: name, 
                value: variableValue,
                location: .bundle(bundle ?? .main)
            )
        )
    }

    /// Creates a labeled image that you can use as content for controls, with
    /// the specified label and variable value.
    ///
    /// This initializer creates an image using a using a symbol in the
    /// specified bundle. The rendered symbol may alter its appearance to
    /// represent the value provided in `variableValue`.
    ///
    /// > Note: See WWDC22 session [10158: Adopt variable color in SF
    /// Symbols](https://developer.apple.com/wwdc22/10158/) for details on
    /// how to create symbols that support variable values.
    ///
    /// - Parameters:
    ///   - name: The name of the image resource to lookup.
    ///   - variableValue: An optional value between `0.0` and `1.0` that
    ///     the rendered image can use to customize its appearance, if
    ///     specified. If the symbol doesn't support variable values, this
    ///     parameter has no effect.
    ///   - bundle: The bundle to search for the image resource. If
    ///     `nil`, OpenSwiftUI uses the main `Bundle`. Defaults to `nil`.
    ///   - label: The label associated with the image. OpenSwiftUI uses
    ///     the label for accessibility.
    ///
    public init(_ name: String, variableValue: Double?, bundle: Bundle? = nil, label: Text) {
        self.provider = ImageProviderBox(
            provider: NamedImageProvider(
                name: name, 
                value: variableValue,
                label: label,
                location: .bundle(bundle ?? .main)
            )
        )
    }

    /// Creates an unlabeled, decorative image, with a variable value.
    ///
    /// This initializer creates an image using a using a symbol in the
    /// specified bundle. The rendered symbol may alter its appearance to
    /// represent the value provided in `variableValue`.
    ///
    /// > Note: See WWDC22 session [10158: Adopt variable color in SF
    /// Symbols](https://developer.apple.com/wwdc22/10158/) for details on
    /// how to create symbols that support variable values.
    ///
    /// OpenSwiftUI ignores this image for accessibility purposes.
    ///
    /// - Parameters:
    ///   - name: The name of the image resource to lookup.
    ///   - variableValue: An optional value between `0.0` and `1.0` that
    ///     the rendered image can use to customize its appearance, if
    ///     specified. If the symbol doesn't support variable values, this
    ///     parameter has no effect.
    ///   - bundle: The bundle to search for the image resource. If
    ///     `nil`, OpenSwiftUI uses the main `Bundle`. Defaults to `nil`.
    ///
    public init(decorative name: String, variableValue: Double?, bundle: Bundle? = nil) {
        self.provider = ImageProviderBox(
            provider: NamedImageProvider(
                name: name, 
                value: variableValue,
                location: .bundle(bundle ?? .main)
            )
        )
    }
}

extension Image {

    /// Initialize an `Image` with an image resource.
    public init(_ resource: ImageResource) {
        self.provider = ImageProviderBox(
            provider: NamedImageProvider(
                name: resource.name, 
                location: .bundle(resource.bundle)
            )
        )
    }
}

extension Image {

    /// Returns a new image configured with the specified allowed
    /// dynamic range.
    ///
    /// The following example enables HDR rendering for a specific
    /// image view, assuming that the image has an HDR (ITU-R 2100)
    /// color space and the output device supports it:
    ///
    ///     Image("hdr-asset").allowedDynamicRange(.high)
    ///
    /// - Parameter range: the requested dynamic range, or nil to
    ///   restore the default allowed range.
    ///
    /// - Returns: a new image.
    public func allowedDynamicRange(_ range: Image.DynamicRange?) -> Image {
        Image(
            provider: ImageProviderBox(
                provider: DynamicRangeProvider(
                    base: provider, 
                    range: range
                )
            )
        )
    }
}

extension Image {

    /// Initializes an image of the given size, with contents provided by a
    /// custom rendering closure.
    ///
    /// Use this initializer to create an image by calling drawing commands on a
    /// ``GraphicsContext`` provided to the `renderer` closure.
    ///
    /// The following example shows a custom image created by passing a
    /// `GraphicContext` to draw an ellipse and fill it with a gradient:
    ///
    ///     let mySize = CGSize(width: 300, height: 200)
    ///     let image = Image(size: mySize) { context in
    ///         context.fill(
    ///             Path(
    ///                 ellipseIn: CGRect(origin: .zero, size: mySize)),
    ///                 with: .linearGradient(
    ///                     Gradient(colors: [.yellow, .orange]),
    ///                     startPoint: .zero,
    ///                     endPoint: CGPoint(x: mySize.width, y:mySize.height))
    ///         )
    ///     }
    ///
    /// ![An ellipse with a gradient that blends from yellow at the upper-
    /// left to orange at the bottom-right.](Image-2)
    ///
    /// - Parameters:
    ///   - size: The size of the newly-created image.
    ///   - label: The label associated with the image. OpenSwiftUI uses the label
    ///     for accessibility.
    ///   - opaque: A Boolean value that indicates whether the image is fully
    ///     opaque. This may improve performance when `true`. Don't render
    ///     non-opaque pixels to an image declared as opaque. Defaults to `false`.
    ///   - colorMode: The working color space and storage format of the image.
    ///     Defaults to ``ColorRenderingMode/nonLinear``.
    ///   - renderer: A closure to draw the contents of the image. The closure
    ///     receives a ``GraphicsContext`` as its parameter.
    public init(size: Size3D, label: Text? = nil, opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, renderer: @escaping (inout GraphicsContext) -> Void) {
        self.provider = ImageProviderBox(
            provider: RenderedImageProviderBox(
                size: size, 
                label: label, 
                opaque: opaque, 
                colorMode: colorMode, 
                renderer: renderer
            )
        )
    }
}

extension Image {

    /// Initializes an image with a data object.
    ///
    /// - Parameter data: The data object to initialize the image with.
    public init(_ data: Data) {
        self.provider = ImageProviderBox(
            provider: DataImageProviderBox(data: data)
        )
    }
}

extension Image : View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of primitive views that OpenSwiftUI provides, plus other
    /// composite views that you've already defined:    
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    public var body: Never { 
        fatalError("not implemented yet") 
    }

    /// Creates the view's representation in the OpenSwiftUI view graph.
    /// 
    /// - Parameters:
    ///   - view: The view to create.
    ///   - inputs: The inputs for the view.
    /// - Returns: The outputs for the view.
    public static func _makeView(view: _GraphValue<Image>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("not implemented yet")
    }
}