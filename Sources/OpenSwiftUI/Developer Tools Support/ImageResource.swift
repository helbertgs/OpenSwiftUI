import Foundation

//
// ImageResource.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

/// An image resource.
public struct ImageResource : Hashable, Sendable {

    // MARK: - Checking Characteristics.

    /// The name of the image resource.
    let name: String

    /// The bundle of the image resource.
    let bundle: Bundle

    // MARK: - Creating an Image Resource.

    /// Creates an image from a resource with the specified name in the
    /// given bundle.
    public init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }
}