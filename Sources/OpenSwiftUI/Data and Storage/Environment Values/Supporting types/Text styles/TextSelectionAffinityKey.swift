//
// TextSelectionAffinityKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct TextSelectionAffinityKey : EnvironmentKey {
    public static var defaultValue: TextSelectionAffinity {
        .automatic
    }
}

extension EnvironmentValues {

    /// A representation of the direction or association of a selection or cursor relative to a text character. 
    /// This concept becomes much more prominent when dealing with bidirectional text (text that contains both LTR and RTL scripts, like English and Arabic combined).
    ///
    /// You can configure the selection affinity on a given hierarchy by using the ``textSelectionAffinity(_:)`` modifier.
    public var textSelectionAffinity: TextSelectionAffinity {
        get { self[TextSelectionAffinityKey.self] }
        set { self[TextSelectionAffinityKey.self] = newValue }
    }
}
