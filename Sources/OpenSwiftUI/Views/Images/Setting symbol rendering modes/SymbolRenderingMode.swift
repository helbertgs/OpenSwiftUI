//
// SymbolRenderingMode.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

/// A symbol rendering mode.
public struct SymbolRenderingMode : Codable, Equatable, Hashable, Sendable {

    // MARK: - Checking Characteristics.

    /// The storage for the symbol rendering mode.
    let storage: Storage

    // MARK: - Creating a Symbol Rendering Mode.

    /// Creates a symbol rendering mode with the given storage.
    /// 
    /// - Parameter storage: The storage for the symbol rendering mode.
    init(storage: Storage) {
        self.storage = storage
    }

    // MARK: - Getting symbol rendering modes

    /// A mode that renders symbols as a single layer filled with the
    /// foreground style.
    ///
    /// For example, you can render a filled exclamation mark triangle in
    /// purple:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .symbolRenderingMode(.monochrome)
    ///         .foregroundStyle(Color.purple)
    public static let monochrome = SymbolRenderingMode(storage: .monochrome)

    /// A mode that renders symbols as multiple layers with their inherit
    /// styles.
    ///
    /// The layers may be filled with their own inherent styles, or the
    /// foreground style. For example, you can render a filled exclamation
    /// mark triangle in its inherent colors, with yellow for the triangle and
    /// white for the exclamation mark:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .symbolRenderingMode(.multicolor)
    public static let multicolor = SymbolRenderingMode(storage: .multicolor)

    /// A mode that renders symbols as multiple layers, with different opacities
    /// applied to the foreground style.
    ///
    /// OpenSwiftUI fills the first layer with the foreground style, and the others
    /// the secondary, and tertiary variants of the foreground style. You can
    /// specify these styles explicitly using the ``View/foregroundStyle(_:_:)``
    /// and ``View/foregroundStyle(_:_:_:)`` modifiers. If you only specify
    /// a primary foreground style, OpenSwiftUI automatically derives
    /// the others from that style. For example, you can render a filled
    /// exclamation mark triangle with purple as the tint color for the
    /// exclamation mark, and lower opacity purple for the triangle:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .symbolRenderingMode(.hierarchical)
    ///         .foregroundStyle(Color.purple)
    public static let hierarchical = SymbolRenderingMode(storage: .hierarchical)

    /// A mode that renders symbols as multiple layers, with different styles
    /// applied to the layers.
    ///
    /// In this mode OpenSwiftUI maps each successively defined layer in the image
    /// to the next of the primary, secondary, and tertiary variants of the
    /// foreground style. You can specify these styles explicitly using the
    /// ``View/foregroundStyle(_:_:)`` and ``View/foregroundStyle(_:_:_:)``
    /// modifiers. If you only specify a primary foreground style, OpenSwiftUI
    /// automatically derives the others from that style. For example, you can
    /// render a filled exclamation mark triangle with yellow as the tint color
    /// for the exclamation mark, and fill the triangle with cyan:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .symbolRenderingMode(.palette)
    ///         .foregroundStyle(Color.yellow, Color.cyan)
    ///
    /// You can also omit the symbol rendering mode, as specifying multiple
    /// foreground styles implies switching to palette rendering mode:
    ///
    ///     Image(systemName: "exclamationmark.triangle.fill")
    ///         .foregroundStyle(Color.yellow, Color.cyan)
    public static let palette = SymbolRenderingMode(storage: .palette)
}

extension SymbolRenderingMode {

    /// The storage for the symbol rendering mode.
    enum Storage : String, Codable, Equatable, Hashable, Sendable {

        /// A mode that renders symbols as a single layer filled with the
        /// foreground style.
        case monochrome

        /// A mode that renders symbols as multiple layers with their inherit
        /// styles.
        case multicolor

        /// A mode that renders symbols as multiple layers, with different opacities
        /// applied to the foreground style.
        case hierarchical

        /// A mode that renders symbols as multiple layers, with different styles
        /// applied to the layers.
        case palette
    }
}