//
// AsyncImagePhase.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// The current phase of the asynchronous image loading operation.
///
/// When you create an ``AsyncImage`` instance with the
/// ``AsyncImage/init(url:scale:transaction:content:)`` initializer, you define
/// the appearance of the view using a `content` closure. OpenSwiftUI calls the
/// closure with a phase value at different points during the load operation
/// to indicate the current state. Use the phase to decide what to draw.
/// For example, you can draw the loaded image if it exists, a view that
/// indicates an error, or a placeholder:
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
public enum AsyncImagePhase : Sendable {

    /// No image is loaded.
    case empty

    /// An image successfully loaded.
    case success(Image)

    /// An image failed to load with an error.
    case failure(any Error)

    /// The loaded image, if any.
    ///
    /// If this value isn't `nil`, the image load operation has finished,
    /// and you can use the image to update the view. You can use the image
    /// directly, or you can modify it in some way. For example, you can add
    /// a ``Image/resizable(capInsets:resizingMode:)`` modifier to make the
    /// image resizable.
    public var image: Image? {
        return switch self {
            case .success(let image): image
            default: nil
        }
    }

    /// The error that occurred when attempting to load an image, if any.
    public var error: (any Error)? { 
        return switch self {
            case .failure(let error): error
            default: nil
        }
    }
}