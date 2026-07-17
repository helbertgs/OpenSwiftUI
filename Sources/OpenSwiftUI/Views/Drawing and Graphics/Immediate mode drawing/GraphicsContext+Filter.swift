//
// GraphicsContext+Filter.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

extension GraphicsContext {

    /// A type that applies image processing operations to rendered content.
    /// 
    /// Create and configure a filter that produces an image processing effect, like adding a drop shadow or a blur effect, by calling one of the factory methods defined by the ``Filter`` structure. 
    /// Call the ``addFilter(_:options:)`` method to add the filter to a ``GraphicsContext``. 
    /// The filter only affects content that you draw into the context after adding the filter.
    public struct Filter : Sendable {
    }
}