//
//  ShapeView.swift
//  OpenSwiftUI
//
//  Created by Helbert Gomes on 2026-07-23.
//

/// A view that provides a shape that you can use for drawing operations.
///
/// Use this type with the drawing methods on ``Shape`` to apply multiple fills
/// and/or strokes to a shape. For example, the following code applies a fill
/// and stroke to a capsule shape:
///
///     Capsule()
///         .fill(.yellow)
///         .stroke(.blue, lineWidth: 8)
///
public protocol ShapeView<Content> : View {

    /// The type of shape this can provide.
    associatedtype Content : Shape

    /// The shape that this type draws and provides for other drawing
    /// operations.
    var shape: Self.Content { get }
}
