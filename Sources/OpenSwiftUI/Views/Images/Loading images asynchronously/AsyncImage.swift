//
// AsyncImage.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenSpatial

#if os(Windows)
import FoundationNetworking
#endif

/// A view that asynchronously loads and displays an image.
///
/// This view uses the shared
/// <doc://com.apple.documentation/documentation/Foundation/URLSession>
/// instance to load an image from the specified URL, and then display it.
/// For example, you can display an icon that's stored on a server:
///
///     AsyncImage(url: URL(string: "https://example.com/icon.png"))
///         .frame(width: 200, height: 200)
///
/// Until the image loads, the view displays a standard placeholder that
/// fills the available space. After the load completes successfully, the view
/// updates to display the image. In the example above, the icon is smaller
/// than the frame, and so appears smaller than the placeholder.
///
/// ![A diagram that shows a grey box on the left, the OpenSwiftUI icon on the
/// right, and an arrow pointing from the first to the second. The icon
/// is about half the size of the grey box.](AsyncImage-1)
///
/// You can specify a custom placeholder using
/// ``init(url:scale:content:placeholder:)``. With this initializer, you can
/// also use the `content` parameter to manipulate the loaded image.
/// For example, you can add a modifier to make the loaded image resizable:
///
///     AsyncImage(url: URL(string: "https://example.com/icon.png")) { image in
///         image.resizable()
///     } placeholder: {
///         ProgressView()
///     }
///     .frame(width: 50, height: 50)
///
/// For this example, OpenSwiftUI shows a ``ProgressView`` first, and then the
/// image scaled to fit in the specified frame:
///
/// ![A diagram that shows a progress view on the left, the OpenSwiftUI icon on the
/// right, and an arrow pointing from the first to the second.](AsyncImage-2)
///
/// > Important: You can't apply image-specific modifiers, like
/// ``Image/resizable(capInsets:resizingMode:)``, directly to an `AsyncImage`.
/// Instead, apply them to the ``Image`` instance that your `content`
/// closure gets when defining the view's appearance.
///
/// To gain more control over the loading process, use the
/// ``init(url:scale:transaction:content:)`` initializer, which takes a
/// `content` closure that receives an ``AsyncImagePhase`` to indicate
/// the state of the loading operation. Return a view that's appropriate
/// for the current phase:
///
///     AsyncImage(url: URL(string: "https://example.com/icon.png")) { phase in
///         if let image = phase.image {
///             image // Displays the loaded image.
///         } else if phase.error != nil {
///             Color.red // Indicates an error.
///         } else {
///             Color.blue // Acts as a placeholder.
///         }
///     }
///
public struct AsyncImage<Content> where Content : View {

    // MARK: - Checking Characteristics.

    /// The URL of the image to display.
    let url: URL?

    /// The scale to use for the image.
    let scale: Double

    /// The transaction to use when the phase changes.
    let transaction: Transaction

    /// The content to display for the image.
    let content: (AsyncImagePhase) -> Content

    /// The loading state of the image.
    let _loadingState: State<LoadingState>

    /// Loads and displays a modifiable image from the specified URL using
    /// a custom placeholder until the image loads.
    ///
    /// Until the image loads, OpenSwiftUI displays the placeholder view that
    /// you specify. When the load operation completes successfully, OpenSwiftUI
    /// updates the view to show content that you specify, which you
    /// create using the loaded image. For example, you can show a green
    /// placeholder, followed by a tiled version of the loaded image:
    ///
    ///     AsyncImage(url: URL(string: "https://example.com/icon.png")) { image in
    ///         image.resizable(resizingMode: .tile)
    ///     } placeholder: {
    ///         Color.green
    ///     }
    ///
    /// If the load operation fails, OpenSwiftUI continues to display the
    /// placeholder. To be able to display a different view on a load error,
    /// use the ``init(url:scale:transaction:content:)`` initializer instead.
    ///
    /// - Parameters:
    ///   - url: The URL of the image to display.
    ///   - scale: The scale to use for the image. The default is `1`. Set a
    ///     different value when loading images designed for higher resolution
    ///     displays. For example, set a value of `2` for an image that you
    ///     would name with the `@2x` suffix if stored in a file on disk.
    ///   - content: A closure that takes the loaded image as an input, and
    ///     returns the view to show. You can return the image directly, or
    ///     modify it as needed before returning it.
    ///   - placeholder: A closure that returns the view to show until the
    ///     load operation completes successfully.
    public init<I, P>(url: URL?, scale: Double = 1, @ViewBuilder content: @escaping (Image) -> I, @ViewBuilder placeholder: @escaping () -> P) where Content == _ConditionalContent<I, P>, I : View, P : View {
        self.init(url: url, scale: scale) { phase in
            if let i = phase.image {
                content(i)
            } else {
                placeholder()
            }
        }
    }

    // MARK: - Loading an image in phases

    /// Loads and displays a modifiable image from the specified URL in phases.
    ///
    /// If you set the asynchronous image's URL to `nil`, or after you set the
    /// URL to a value but before the load operation completes, the phase is
    /// ``AsyncImagePhase/empty``. After the operation completes, the phase
    /// becomes either ``AsyncImagePhase/failure(_:)`` or
    /// ``AsyncImagePhase/success(_:)``. In the first case, the phase's
    /// ``AsyncImagePhase/error`` value indicates the reason for failure.
    /// In the second case, the phase's ``AsyncImagePhase/image`` property
    /// contains the loaded image. Use the phase to drive the output of the
    /// `content` closure, which defines the view's appearance:
    ///
    ///     AsyncImage(url: URL(string: "https://example.com/icon.png")) { phase in
    ///         if let image = phase.image {
    ///             image // Displays the loaded image.
    ///         } else if phase.error != nil {
    ///             Color.red // Indicates an error.
    ///         } else {
    ///             Color.blue // Acts as a placeholder.
    ///         }
    ///     }
    ///
    /// To add transitions when you change the URL, apply an identifier to the
    /// ``AsyncImage``.
    ///
    /// - Parameters:
    ///   - url: The URL of the image to display.
    ///   - scale: The scale to use for the image. The default is `1`. Set a
    ///     different value when loading images designed for higher resolution
    ///     displays. For example, set a value of `2` for an image that you
    ///     would name with the `@2x` suffix if stored in a file on disk.
    ///   - transaction: The transaction to use when the phase changes.
    ///   - content: A closure that takes the load phase as an input, and
    ///     returns the view to display for the specified phase.
    public init(url: URL?, scale: Double = 1, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content

        self._loadingState = State<LoadingState>(
            initialValue: LoadingState(
                task: Task {
                    do {
                        if let url = url {
                            let (data, _) = try await URLSession.shared.data(from: url)
                            return .success(Image(data))
                        } else {
                            return .empty
                        }
                    } catch {
                        return .failure(error)
                    }
                }, 
                url: url, 
                phase: .empty
            )
        )
    }

    /// Loads and displays an image from the specified URL.
    ///
    /// Until the image loads, OpenSwiftUI displays a default placeholder. When
    /// the load operation completes successfully, OpenSwiftUI updates the
    /// view to show the loaded image. If the operation fails, OpenSwiftUI
    /// continues to display the placeholder. The following example loads
    /// and displays an icon from an example server:
    ///
    ///     AsyncImage(url: URL(string: "https://example.com/icon.png"))
    ///
    /// If you want to customize the placeholder or apply image-specific
    /// modifiers --- like ``Image/resizable(capInsets:resizingMode:)`` ---
    /// to the loaded image, use the ``init(url:scale:content:placeholder:)``
    /// initializer instead.
    ///
    /// - Parameters:
    ///   - url: The URL of the image to display.
    ///   - scale: The scale to use for the image. The default is `1`. Set a
    ///     different value when loading images designed for higher resolution
    ///     displays. For example, set a value of `2` for an image that you
    ///     would name with the `@2x` suffix if stored in a file on disk.
    public init(url: URL?, scale: Double = 1) {
        fatalError("Not implemented")
    }

    /// The loading state of the image.
    struct LoadingState: Sendable {

        /// The task that is loading the image.
        let task: Task<AsyncImagePhase, Never>

        /// The URL of the image.
        let url: URL?

        /// The phase of the image loading operation.
        let phase: AsyncImagePhase
    }
}

extension AsyncImage : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that OpenSwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    public var body: Never {
        fatalError("Not implemented")
    }
}