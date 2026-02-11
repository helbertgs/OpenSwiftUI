//
// TextSelectionAffinity.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

/// A representation of the direction or association of a selection or cursor relative to a text character. 
/// This concept becomes much more prominent when dealing with bidirectional text (text that contains both LTR and RTL scripts, like English and Arabic combined).
/// 
/// This type also determines whether, for example, the insertion point appears after the last character on a line or before the first character on the following line in cases where text wraps across line boundaries.
/// 
/// Given the scenario hello|مرحبا, where | represents the cursor & مرحبا represents “hello” in Arabic, the ambiguity arises because:
/// - If the cursor is associated with the end of the English word, it would be as if you’re continuing to type in English (LTR).
/// - If the cursor is associated with the beginning of the Arabic word, it would also be as if you’re continuing to type in Arabic (RTL).
/// 
/// ``TextSelectionAffinity`` helps resolve this ambiguity by determining the direction or association of the cursor relative to the surrounding text.
/// 
/// You can configure the selection affinity on a given hierarchy by using the ``textSelectionAffinity(_:)`` modifier:
public enum TextSelectionAffinity : String, Codable, Equatable, Hashable, Sendable {

    // MARK: - Enumeration Cases

    /// A selection affinity determined by the framework based on the current context.
    case automatic

    /// An downstream selection affinity. In this case, the cursor is associated with the character immediately after it.
    case downstream

    /// An upstream selection affinity. In this case, the cursor is associated with the character immediately before it.
    case upstream
}