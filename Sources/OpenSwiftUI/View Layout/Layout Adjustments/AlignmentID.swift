//
// AlignmentID.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// Types used to identify alignment guides.
///
/// Types conforming to `AlignmentID` have a corresponding alignment guide
/// value, typically declared as a static constant property of
/// ``HorizontalAlignment`` or ``VerticalAlignment``.
public protocol AlignmentID {

    // MARK: - Static Function(s).
    /// The value of the corresponding guide in the given context when not
    /// otherwise set in that context.
    static func defaultValue(in context: ViewDimensions) -> Float
}
