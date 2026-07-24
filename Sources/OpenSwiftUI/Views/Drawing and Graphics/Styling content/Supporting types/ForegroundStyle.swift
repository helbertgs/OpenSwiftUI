//
// ForegroundStyle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

/// The foreground style in the current context.
///
/// You can also use ``ShapeStyle/foreground`` to construct this style.
@frozen
public struct ForegroundStyle : ShapeStyle {

    /// Creates a foreground style instance.
    @inlinable
    public init() {
    }

    /// The type of shape style this will resolve to.
    ///
    /// When you create a custom shape style, Swift infers this type
    /// from your implementation of the required `resolve` function.
    public typealias Resolved = Never
}
