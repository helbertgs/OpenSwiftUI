//
// Canvas.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A view type that supports immediate mode drawing.
public struct Canvas<Symbols> : Copyable, View where Symbols : View {

    public typealias Body = Never

    // MARK: - Managing opacity and color

    /// A Boolean that indicates whether the canvas is fully opaque.
    public let isOpaque: Bool

    /// The working color space and storage format of the canvas.
    public let colorMode: ColorRenderingMode

    // MARK: - Referencing symbols

    /// A view that provides child views that you can use in the drawing callback.
    public let symbols: Symbols

    // MARK: - Rendering

    /// A Boolean that indicates whether the canvas can present its contents to its parent view asynchronously.
    public let rendersAsynchronously: Bool

    /// The drawing callback that you use to draw into the canvas.
    public let renderer: (inout GraphicsContext, Size3D) -> Void

    // MARK: - Initializers

    /// Creates and configures a canvas that you supply with renderable child views.
    /// - Parameters:
    ///   - opaque: A Boolean that indicates whether the canvas is fully opaque. You might be able to improve performance by setting this value to true, but then drawing a non-opaque image into the context produces undefined results. The default is false.
    ///   - colorMode: A working color space and storage format of the canvas. The default is ``ColorRenderingMode.nonLinear``.
    ///   - rendersAsynchronously: A Boolean that indicates whether the canvas can present its contents to its parent view asynchronously. The default is false.
    ///   - renderer: A closure in which you conduct immediate mode drawing. The closure takes two inputs: a context that you use to issue drawing commands and a size — representing the current size of the canvas — that you can use to customize the content. The canvas calls the renderer any time it needs to redraw the content.
    ///   - symbols: A ``ViewBuilder`` that you use to supply OpenSwiftUI views to the canvas for use during drawing. Uniquely tag each view using the ``View/tag(_:)`` modifier, so that you can find them from within your renderer using the ``resolveSymbol(id:)`` method.
    public init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, rendersAsynchronously: Bool = false, renderer: @escaping (inout GraphicsContext, Size3D) -> Void, @ViewBuilder symbols: () -> Symbols) {
        self.isOpaque = opaque
        self.colorMode = colorMode
        self.rendersAsynchronously = rendersAsynchronously
        self.symbols = symbols()
        self.renderer = renderer
    }
}

extension Canvas where Symbols == EmptyView {

    /// Creates and configures a canvas.
    ///
    /// - Parameters:
    ///   - opaque: A Boolean that indicates whether the canvas is fully opaque. You might be able to improve performance by setting this value to true, but then drawing a non-opaque image into the context produces undefined results. The default is false.
    ///   - colorMode: A working color space and storage format of the canvas. The default is ``ColorRenderingMode.nonLinear``.
    ///   - rendersAsynchronously: A Boolean that indicates whether the canvas can present its contents to its parent view asynchronously. The default is false.
    ///   - renderer: A closure in which you conduct immediate mode drawing. The closure takes two inputs: a context that you use to issue drawing commands and a size — representing the current size of the canvas — that you can use to customize the content. The canvas calls the renderer any time it needs to redraw the content.
    public init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, rendersAsynchronously: Bool = false, renderer: @escaping (inout GraphicsContext, Size3D) -> Void) {
        self.isOpaque = opaque
        self.colorMode = colorMode
        self.rendersAsynchronously = rendersAsynchronously
        self.symbols = EmptyView()
        self.renderer = renderer
    }
}