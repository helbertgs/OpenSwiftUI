//
// AccessibilityOptionalRotorContent.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 19, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen @MainActor @preconcurrency 
public struct AccessibilityOptionalRotorContent<Content>: AccessibilityRotorContent where Content : AccessibilityRotorContent {
  
    public let content: Content?
  
    @inlinable public init(_ content: Content?) {
        self.content = content
    }
  
    public var body: some AccessibilityRotorContent { 
        fatalError() 
    }
  
    nonisolated public static func _makeEntries(content: _GraphValue<AccessibilityOptionalRotorContent<Content>>, inputs: _AccessibilityRotorEntryInputs) -> _AccessibilityRotorEntryOutputs {
        .init()
    }

    nonisolated public static func _entryCount(inputs: _AccessibilityRotorEntryInputs) -> Int? {
        0
    }
}