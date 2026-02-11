//
// MultilineTextAlignmentKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct MultilineTextAlignmentKey : EnvironmentKey {
    public static var defaultValue: TextAlignment {
        .leading
    }
}

extension EnvironmentValues {

    /// An environment value that indicates how a text view aligns its lines when the content wraps or contains newlines.
    ///
    /// Set this value for a view hierarchy by applying the ``multilineTextAlignment(_:)`` view modifier. 
    /// Views in the hierarchy that display text, like ``Text`` or ``TextEditor``, read the value from the environment and adjust their text alignment accordingly.
    /// 
    /// This value has no effect on a Text view that contains only one line of text, because a text view has a width that exactly matches the width of its widest line. 
    /// If you want to align an entire text view rather than its contents, set the aligment of its container, like a ``VStack`` or a frame that you create with the ``frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)`` modifier.
    public var multilineTextAlignment: TextAlignment {
        get { self[MultilineTextAlignmentKey.self] }
        set { self[MultilineTextAlignmentKey.self] = newValue }
    }
}
