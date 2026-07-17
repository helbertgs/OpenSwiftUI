//
// AccessibilityHeadingLevel.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 19, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// The hierarchy of a heading in relation other headings.
@frozen public enum AccessibilityHeadingLevel: BitwiseCopyable, Copyable, Equatable, Hashable, Sendable {

    // MARK: - Getting the heading level

    /// Level 1 heading.
    case h1

    /// Level 2 heading.
    case h2

    /// Level 3 heading.
    case h3

    /// Level 4 heading.
    case h4

    /// Level 5 heading.
    case h5

    /// Level 6 heading.
    case h6

    /// A heading without a hierarchy.
    case unspecified
}