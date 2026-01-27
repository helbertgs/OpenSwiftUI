//
// ImageRenderer.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenCombine
import OpenSpatial

/// An object that creates images from OpenSwiftUI views.
///
/// Use `ImageRenderer` to export bitmap image data from a OpenSwiftUI view. You
/// initialize the renderer with a view, then render images on demand,
/// either by calling the ``render(rasterizationScale:renderer:)`` method, or
/// by using the renderer's properties to create a
/// <doc://com.apple.documentation/documentation/CoreGraphics/CGImage>,
/// <doc://com.apple.documentation/documentation/AppKit/NSImage>, or
/// <doc://com.apple.documentation/documentation/UIKit/UIImage>.
///
/// By drawing to a ``Canvas`` and exporting with an `ImageRenderer`,
/// you can generate images from any progammatically-rendered content, like
/// paths, shapes, gradients, and more. You can also render standard OpenSwiftUI
/// views like ``Text`` views, or containers of multiple view types.
///
/// The following example uses a private `createAwardView(forUser:date:)` method
/// to create a game app's view of a trophy symbol with a user name and date.
/// This view combines a ``Canvas`` that applies a shadow filter with
/// two ``Text`` views into a ``VStack``. A ``Button`` allows the person to
/// save this view. The button's action uses an `ImageRenderer` to rasterize a
/// `CGImage` and then calls a private `uploadAchievementImage(_:)` method to
/// encode and upload the image.
///
///     var body: some View {
///         let trophyAndDate = createAwardView(forUser: playerName,
///                                              date: achievementDate)
///         VStack {
///             trophyAndDate
///             Button("Save Achievement") {
///                 let renderer = ImageRenderer(content: trophyAndDate)
///                 if let image = renderer.cgImage {
///                     uploadAchievementImage(image)
///                 }
///             }
///         }
///     }
///
///     private func createAwardView(forUser: String, date: Date) -> some View {
///         VStack {
///             Image(systemName: "trophy")
///                 .resizable()
///                 .frame(width: 200, height: 200)
///                 .frame(maxWidth: .infinity, maxHeight: .infinity)
///                 .shadow(color: .mint, radius: 5)
///             Text(playerName)
///                 .font(.largeTitle)
///             Text(achievementDate.formatted())
///         }
///         .multilineTextAlignment(.center)
///         .frame(width: 200, height: 290)
///     }
///
/// ![A large trophy symbol, drawn with a mint-colored shadow. Below this, a
/// user name and the date and time. At the bottom, a button with the title
/// Save Achievement allows people to save and upload an image of this
/// view.](ImageRenderer-1)
///
/// Because `ImageRenderer` conforms to
/// <doc://com.apple.documentation/documentation/Combine/ObservableObject>, you
/// can use it to produce a stream of images as its properties change. Subscribe
/// to the renderer's ``ImageRenderer/objectWillChange`` publisher, then use the
/// renderer to rasterize a new image each time the subscriber receives an
/// update.
///
/// - Important: `ImageRenderer` output only includes views that OpenSwiftUI renders,
/// such as text, images, shapes, and composite views of these types. It
/// does not render views provided by native platform frameworks (AppKit and
/// UIKit) such as web views, media players, and some controls. For these views,
/// `ImageRenderer` displays a placeholder image, similar to the behavior of
/// ``View/drawingGroup(opaque:colorMode:)``.
///
/// ### Rendering to a PDF context
///
/// The ``render(rasterizationScale:renderer:)`` method renders the specified
/// view to any
/// <doc://com.apple.documentation/documentation/CoreGraphics/CGContext>. That
/// means you aren't limited to creating a rasterized `CGImage`. For
/// example, you can generate PDF data by rendering to a PDF context. The
/// resulting PDF maintains resolution-independence for supported members of the
/// view hierarchy, such as text, symbol images, lines, shapes, and fills.
///
/// The following example uses the `createAwardView(forUser:date:)` method from
/// the previous example, and exports its contents as an 800-by-600 point PDF to
/// the file URL `renderURL`. It uses the `size` parameter sent to the
/// rendering closure to center the `trophyAndDate` view vertically and
/// horizontally on the page.
///
///     var body: some View {
///         let trophyAndDate = createAwardView(forUser: playerName,
///                                             date: achievementDate)
///         VStack {
///             trophyAndDate
///             Button("Save Achievement") {
///                 let renderer = ImageRenderer(content: trophyAndDate)
///                 renderer.render { size, renderer in
///                     var mediaBox = CGRect(origin: .zero,
///                                           size: CGSize(width: 800, height: 600))
///                     guard let consumer = CGDataConsumer(url: renderURL as CFURL),
///                           let pdfContext =  CGContext(consumer: consumer,
///                                                       mediaBox: &mediaBox, nil)
///                     else {
///                         return
///                     }
///                     pdfContext.beginPDFPage(nil)
///                     pdfContext.translateBy(x: mediaBox.size.width / 2 - size.width / 2,
///                                            y: mediaBox.size.height / 2 - size.height / 2)
///                     renderer(pdfContext)
///                     pdfContext.endPDFPage()
///                     pdfContext.closePDF()
///                 }
///             }
///         }
///     }
///
/// ### Creating an image from drawing instructions
///
/// `ImageRenderer` makes it possible to create a custom image by drawing into a
/// ``Canvas``, rendering a `CGImage` from it, and using that to initialize an
/// ``Image``. To simplify this process, use the `Image`
/// initializer ``Image/init(size:label:opaque:colorMode:renderer:)``, which
/// takes a closure whose argument is a ``GraphicsContext`` that you can
/// directly draw into.
final public class ImageRenderer<Content> : OpenCombine.ObservableObject where Content : View {

    // MARK: - Creating an image renderer

    /// Creates a renderer object with a source content view.
    ///
    /// - Parameter view: A ``View`` to render.
    @MainActor public init(content view: Content) {
        self.content = view
    }

    // MARK: - Providing the source view

    /// The root view rendered by this image renderer.
    @MainActor final public var content: Content

    // MARK: - Accessing renderer properties

    /// The size proposed to the root view.
    ///
    /// The default value of this property, ``ProposedViewSize/unspecified``,
    /// produces an image that matches the original view size. You can provide
    /// a custom ``ProposedViewSize`` to override the view's size in one or
    /// both dimensions.
    @MainActor final public var proposedSize: ProposedViewSize = .unspecified

    /// The scale at which to render the image.
    ///
    /// This value is a ratio of view points to image pixels. This relationship
    /// means that values greater than `1.0` create an image larger than the
    /// original content view, and less than `1.0` creates a smaller image. The
    /// following example shows a 100 x 50 rectangle view and an image rendered
    /// from it with a `scale` of `2.0`, resulting in an image size of
    /// 200 x 100.
    ///
    ///     let rectangle = Rectangle()
    ///         .frame(width: 100, height: 50)
    ///     let renderer = ImageRenderer(content: rectangle)
    ///     renderer.scale = 2.0
    ///     if let rendered = renderer.cgImage {
    ///         print("Scaled image: \(rendered.width) x \(rendered.height)")
    ///     }
    ///     // Prints "Scaled image: 200 x 100"
    ///
    /// The default value of this property is `1.0`.
    @MainActor final public var scale: Double = 1.0

    /// A Boolean value that indicates whether the alpha channel of the image is
    /// fully opaque.
    ///
    /// Setting this value to `true`, meaning the alpha channel is opaque, may
    /// improve performance. Don't render non-opaque pixels to a renderer
    /// declared as opaque. This property defaults to `false`.
    @MainActor final public var isOpaque: Bool = false

    /// The working color space and storage format of the image.
    @MainActor final public var colorMode: ColorRenderingMode = .nonLinear

    /// The allowed dynamic range of the image, or nil to mark that the
    /// dynamic range of the image should be unrestricted. This
    /// property defaults to `sdr`, i.e. HDR content will be tone
    /// mapped to SDR.
    @MainActor final public var allowedDynamicRange: Image.DynamicRange? = nil

    // MARK: - Rendering images

    /// The current contents of the view, rasterized as a Core Graphics image.
    ///
    /// The renderer notifies its `objectWillChange` publisher when
    /// the contents of the image may have changed.
    @MainActor final public var image: Image? = nil

    /// Draws the renderer's current contents to an arbitrary Core Graphics
    /// context.
    ///
    /// Use this method to rasterize the renderer's content to a
    /// <doc://com.apple.documentation/documentation/CoreGraphics/CGContext>
    /// you provide. The `renderer` closure receives two parameters: the current
    /// size of the view, and a function that renders the view to your
    /// `CGContext`. Implement the closure to provide a suitable `CGContext`,
    /// then invoke the function to render the content to that context.
    ///
    /// - Parameters:
    ///   - rasterizationScale: The scale factor for converting user
    ///     interface points to pixels when rasterizing parts of the
    ///     view that can't be represented as native Core Graphics drawing
    ///     commands.
    ///   - renderer: The closure that sets up the Core Graphics context and
    ///     renders the view. This closure receives two parameters: the size of
    ///     the view and a function that you invoke in the closure to render the
    ///     view at the reported size. This function takes a
    ///     <doc://com.apple.documentation/documentation/CoreGraphics/CGContext>
    ///     parameter, and assumes a bottom-left coordinate space origin.
    @MainActor final public func render(rasterizationScale: Double = 1, renderer: (Size3D, (GraphicsContext) -> Void) -> Void) {
        fatalError("Not implemented")
    }

    // MARK: - Producing a stream of images

    /// If observers of this observed object should be notified when the
    /// produced image changes.
    final public var isObservationEnabled: Bool = false

    /// A publisher that informs subscribers of changes to the image.
    ///
    /// The renderer's
    /// <doc://com.apple.documentation/documentation/Combine/ObservableObject/ObjectWillChangePublisher>
    /// publishes `Void` elements.
    /// Subscribers should interpret any event as indicating that the contents
    /// of the image may have changed.
    final public let objectWillChange: PassthroughSubject<Void, Never> = .init()

    /// The type of publisher that emits before the object has changed.
    public typealias ObjectWillChangePublisher = PassthroughSubject<Void, Never>
}