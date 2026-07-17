//
// GraphicsContext+BlendMode.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

extension GraphicsContext {

    /// The ways that a graphics context combines new content with background content.
    /// 
    /// Use one of these values to set the blendMode property of a ``GraphicsContext``. 
    /// The value that you set affects how content that you draw replaces or combines with content that you previously drew into the context.
    @frozen public struct BlendMode : BitwiseCopyable, Copyable, Equatable, OptionSet, Sendable {

        // MARK: - Accessing the Raw Value

        /// The corresponding value of the raw type.
        public let rawValue: Int

        // MARK: - Creating a Value

        /// Creates a new instance with the specified raw value.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        // MARK: - Getting the default

        /// A mode that paints source image samples over the background image samples.
        public static let normal = GraphicsContext.BlendMode(rawValue: 1)

        // MARK: - Darkening

        /// A mode that creates composite image samples by choosing the darker samples from either the source image or the background.
        public static let darken = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that multiplies the source image samples with the background image samples.
        public static let multiply = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that darkens background image samples to reflect the source image samples.
        public static let colorBurn = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that adds the inverse of the color components of the source and background images, and then inverts the result, producing a darkened composite.
        public static let plusDarker = GraphicsContext.BlendMode(rawValue: 1)

        // MARK: - Lightening

        /// A mode that creates composite image samples by choosing the lighter samples from either the source image or the background.
        public static let lighten = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that multiplies the inverse of the source image samples with the inverse of the background image samples.
        public static let screen = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that brightens the background image samples to reflect the source image samples.
        public static let colorDodge = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that adds the components of the source and background images, resulting in a lightened composite.
        public static let plusLighter = GraphicsContext.BlendMode(rawValue: 1)
        
        // MARK: - Adding contrast

        /// A mode that either multiplies or screens the source image samples with the background image samples, depending on the background color.
        public static let overlay = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that either darkens or lightens colors, depending on the source image sample color.
        public static let softLight = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that either multiplies or screens colors, depending on the source image sample color.
        public static let hardLight = GraphicsContext.BlendMode(rawValue: 1)

        // MARK: - Inverting

        /// A mode that subtracts the brighter of the source image sample color or the background image sample color from the other.
        public static let difference = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that produces an effect similar to that produced by the difference blend mode, but with lower contrast.
        public static let exclusion = GraphicsContext.BlendMode(rawValue: 1)
        
        // MARK: - Mixing color components

        /// A mode that uses the luminance and saturation values of the background with the hue of the source image.
        public static let hue = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that uses the luminance and hue values of the background with the saturation of the source image.
        public static let saturation = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that uses the luminance values of the background with the hue and saturation values of the source image.
        public static let color = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that uses the hue and saturation of the background with the luminance of the source image.
        public static let luminosity = GraphicsContext.BlendMode(rawValue: 1)

        // MARK: - Accessing porter-duff modes

        /// A mode that clears any pixels that the source image overwrites.
        public static let clear = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that replaces background image samples with source image samples.
        public static let copy = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that you use to paint the source image, including its transparency, onto the opaque parts of the background.
        public static let sourceIn = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that you use to paint the source image onto the transparent parts of the background, while erasing the background.
        public static let sourceOut = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that you use to paint the opaque parts of the source image onto the opaque parts of the background.
        public static let sourceAtop = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that you use to paint the source image under the background.
        public static let destinationOver = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that you use to erase any of the background that isn’t covered by opaque source pixels.
        public static let destinationIn = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that you use to erase any of the background that is covered by opaque source pixels.
        public static let destinationOut = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that you use to paint the source image under the background, while erasing any of the background not matched by opaque pixels from the source image.
        public static let destinationAtop = GraphicsContext.BlendMode(rawValue: 1)

        /// A mode that you use to clear pixels where both the source and background images are opaque.
        public static let xor = GraphicsContext.BlendMode(rawValue: 1)
    }
}