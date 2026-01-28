//
// Font+Provider.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A type-erased font provider.
    class AnyFontProvider : @unchecked Sendable { }

    /// A box for a font provider.
    class FontBox<Provider: AnyFontProvider> : AnyFontProvider, @unchecked Sendable {
        
        /// The base provider.
        let base: Provider

        /// Creates a new font box with the given provider.
        ///
        /// - Parameter base: The base provider.
        init(base: Provider) {
            self.base = base
            super.init()
        }
    }

    // MARK: - Data Providers

    /// A font provider for system fonts.
    class SystemProvider : AnyFontProvider, @unchecked Sendable {

        /// The size of the font.
        let size: Double

        /// The weight of the font.
        let weight: Weight?

        /// The design of the font.
        let design: Design?

        /// The text style of the font.
        let textStyle: TextStyle

        /// The maximum size of the font.
        let maximumSize: Double?

        /// Creates a new system font provider with the given size, weight, design, text style, and maximum size.
        ///
        /// - Parameter size: The size of the font.
        /// - Parameter weight: The weight of the font.
        /// - Parameter design: The design of the font.
        /// - Parameter textStyle: The text style of the font.
        /// - Parameter maximumSize: The maximum size of the font.
        init(size: Double, weight: Weight? = nil, design: Design? = nil, textStyle: TextStyle, maximumSize: Double? = nil) {
            self.size = size
            self.weight = weight
            self.design = design
            self.textStyle = textStyle
            self.maximumSize = maximumSize
            
            super.init()
        }
    }

    /// A font provider for named fonts.
    class NamedProvider : AnyFontProvider, @unchecked Sendable {

        /// The name of the font.
        let name: String

        /// The size of the font.
        let size: Double

        /// The text style of the font.
        let textStyle: TextStyle?

        /// Creates a new named font provider with the given name, size, and text style.
        ///
        /// - Parameter name: The name of the font.
        /// - Parameter size: The size of the font.
        /// - Parameter textStyle: The text style of the font.
        init(name: String, size: Double, textStyle: TextStyle? = nil) {
            self.name = name
            self.size = size
            self.textStyle = textStyle

            super.init()
        }
    }

    // MARK: - Text Style Providers

    /// A font provider for text styles.
    class TextStyleProvider : AnyFontProvider, @unchecked Sendable { 

        /// The text style of the font.
        let style: TextStyle

        /// The design of the font.
        let design: Design?

        /// The weight of the font.
        let weight: Weight?

        /// Creates a new text style font provider with the given style, design, and weight.
        ///
        /// - Parameter style: The text style of the font.
        /// - Parameter design: The design of the font.
        /// - Parameter weight: The weight of the font.
        init(style: TextStyle, design: Design? = nil, weight: Weight? = nil) {
            self.style = style
            self.design = design
            self.weight = weight

            super.init()
        }
    }

    // MARK: - Modifier Providers

    /// A font provider for static modifiers.
    class StaticModifierProvider<Modifier> : AnyFontProvider, @unchecked Sendable {

        /// The base provider.
        let base: Any

        /// The modifier.
        let modifier: Modifier

        /// Creates a new static modifier font provider with the given base and modifier.
        ///
        /// - Parameter base: The base provider.
        /// - Parameter modifier: The modifier.
        init(base: Any, modifier: Modifier) {
            self.base = base
            self.modifier = modifier

            super.init()
        }
    }

    // MARK: - Modifiers

    /// The italic modifier.
    struct ItalicModifier {

        /// Whether the italic modifier is active.
        let isActive: Bool

        /// Creates a new italic modifier with the given active state.
        ///
        /// - Parameter isActive: Whether the italic modifier is active.
        init(_ isActive: Bool) {
            self.isActive = isActive
        }
    }

    /// The feature setting modifier.
    struct FeatureSettingModifier {

        /// The type of the feature.
        let type: Int

        /// The selector of the feature.
        let selector: Int

        /// Creates a new feature setting modifier with the given type and selector.
        ///
        /// - Parameter type: The type of the feature.
        /// - Parameter selector: The selector of the feature.
        init(type: Int, selector: Int) {
            self.type = type
            self.selector = selector
        }
    }

    /// The monospaced modifier.
    struct MonospacedModifier {

        /// Whether the monospaced modifier is active.
        let isActive: Bool

        /// Creates a new monospaced modifier with the given active state.
        ///
        /// - Parameter isActive: Whether the monospaced modifier is active.
        init(_ isActive: Bool = true) {
            self.isActive = isActive
        }
    }

    /// The monospace digit modifier.
    struct MonospaceDigitModifier {

        /// Whether the monospace digit modifier is active.
        let isActive: Bool

        /// Creates a new monospace digit modifier with the given active state.
        ///
        /// - Parameter isActive: Whether the monospace digit modifier is active.
        init(_ isActive: Bool) {
            self.isActive = isActive
        }
    }

    /// The weight modifier.
    struct WeightModifier {

        /// The weight of the font.
        let weight: Weight

        /// Creates a new weight modifier with the given weight.
        ///
        /// - Parameter weight: The weight of the font.
        init(_ weight: Weight) {
            self.weight = weight
        }
    }

    /// The width modifier.
    struct WidthModifier {

        /// The width of the font.
        let width: Width

        /// Creates a new width modifier with the given width.
        ///
        /// - Parameter width: The width of the font.
        init(_ width: Width) {
            self.width = width
        }
    }

    /// The bold modifier.
    struct BoldModifier {

        /// Whether the bold modifier is active.
        let isActive: Bool

        /// Creates a new bold modifier with the given active state.
        ///
        /// - Parameter isActive: Whether the bold modifier is active.
        init(_ isActive: Bool) {
            self.isActive = isActive
        }
    }

    /// The leading modifier.
    struct LeadingModifier {

        /// The leading of the font.
        let leading: Leading

        /// Creates a new leading modifier with the given leading.
        ///
        /// - Parameter leading: The leading of the font.
        init(_ leading: Leading) {
            self.leading = leading
        }
    }

    /// The point size modifier.
    struct PointSizeModifier {

        /// The size of the font.
        let size: Double

        /// Creates a new point size modifier with the given size.
        ///
        /// - Parameter size: The size of the font.
        init(_ size: Double) {
            self.size = size
        }
    }
}