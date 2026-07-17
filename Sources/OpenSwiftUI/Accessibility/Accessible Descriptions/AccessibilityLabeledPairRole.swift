//
// AccessibilityLabeledPairRole.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 19, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// The role of an accessibility element in a label / content pair.
@frozen public enum AccessibilityLabeledPairRole: BitwiseCopyable, Copyable, Equatable, Hashable, Sendable {
    
    // MARK: - Getting roles

    /// This element represents the content part of the label / content pair.
    case content
    
    /// This element represents the label part of the label / content pair.
    case label
}