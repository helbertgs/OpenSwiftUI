//
// ContentShapeKind.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

enum ContentShapeKind : String, Codable, Equatable, Hashable, Sendable {
    case accessibility
    case contextMenuPreview
    case dragPreview
    case focusEffect
    case hoverEffect
    case interaction
    case windowDragPrevention
}
