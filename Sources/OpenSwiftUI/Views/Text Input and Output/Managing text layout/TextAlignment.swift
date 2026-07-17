//
// TextAlignment.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Feb 10, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// An alignment position for text along the horizontal axis.
@frozen public enum TextAlignment : CaseIterable, Codable, Copyable, Equatable, Hashable, Sendable {

    // MARK: - Getting text alignments

    case center
    case leading
    case trailing
}