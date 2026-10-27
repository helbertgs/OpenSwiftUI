//
// ShapeStyle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// A color or pattern to use when rendering a shape.
///
/// You create custom shape styles by declaring a type that conforms to the
/// `ShapeStyle` protocol and implementing the required `resolve` function to
/// return a shape style that represents the desired appearance based on the
/// current environment.
///
/// For example this shape style reads the current color scheme from the
/// environment to choose the blend mode its color will be composited with:
///
///     struct MyShapeStyle: ShapeStyle {
///         func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
///             if environment.colorScheme == .light {
///                 return Color.red.blendMode(.lighten)
///             } else {
///                 return Color.red.blendMode(.darken)
///             }
///         }
///     }
///
/// In addition to creating a custom shape style, you can also use one of the
/// concrete styles that OpenSwiftUI defines. To indicate a specific color or
/// pattern, you can use ``Color`` or the style returned by
/// ``ShapeStyle/image(_:sourceRect:scale:)``, or one of the gradient
/// types, like the one returned by
/// ``ShapeStyle/radialGradient(_:center:startRadius:endRadius:)``.
/// To set a color that's appropriate for a given context on a given
/// platform, use one of the semantic styles, like ``ShapeStyle/background`` or
/// ``ShapeStyle/primary``.
///
/// You can use a shape style by:
/// * Filling a shape with a style with the ``Shape/fill(_:style:)``
///   modifier:
///
///     ```
///     Path { path in
///         path.move(to: .zero)
///         path.addLine(to: CGPoint(x: 50, y: 0))
///         path.addArc(
///             center: .zero,
///             radius: 50,
///             startAngle: .zero,
///             endAngle: .degrees(90),
///             clockwise: false)
///     }
///     .fill(.radialGradient(
///         Gradient(colors: [.yellow, .red]),
///         center: .topLeading,
///         startRadius: 15,
///         endRadius: 80))
///     ```
///
///     ![A screenshot of a quarter of a circle filled with
///     a radial gradient.](ShapeStyle-1)
///
/// * Tracing the outline of a shape with a style with either the
///   ``Shape/stroke(_:lineWidth:)`` or the ``Shape/stroke(_:style:)`` modifier:
///
///     ```
///     RoundedRectangle(cornerRadius: 10)
///         .stroke(.mint, lineWidth: 10)
///         .frame(width: 200, height: 50)
///     ```
///
///     ![A screenshot of a rounded rectangle, outlined in mint.](ShapeStyle-2)
///
/// * Styling the foreground elements in a view with the
///   ``View/foregroundStyle(_:)`` modifier:
///
///     ```
///     VStack(alignment: .leading) {
///         Text("Primary")
///             .font(.title)
///         Text("Secondary")
///             .font(.caption)
///             .foregroundStyle(.secondary)
///     }
///     ```
///
///     ![A screenshot of a title in the primary content color above a
///     subtitle in the secondary content color.](ShapeStyle-3)
public protocol ShapeStyle : Sendable {

    /// The type of shape style this will resolve to.
    ///
    /// When you create a custom shape style, Swift infers this type
    /// from your implementation of the required `resolve` function.
    associatedtype Resolved : ShapeStyle

    /// Evaluate to a resolved shape style given the current `environment`.
    func resolve(in environment: EnvironmentValues) -> Self.Resolved
}

extension ShapeStyle where Self == ForegroundStyle {

    public static var foreground: ForegroundStyle {
        .init()
    }
}
