//
// AccessibilityRotorContentBuilder.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 19, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// Result builder you use to generate rotor entry content.
@MainActor @resultBuilder public struct AccessibilityRotorContentBuilder {
    
    public static func buildExpression<Content>(_ content: Content) -> Content where Content: AccessibilityRotorContent {
       content
    }
    
    public static func buildBlock<Content>(_ content: Content) -> some AccessibilityRotorContent where Content: AccessibilityRotorContent {
        content
    }
  
    public static func buildIf<Content>(_ content: Content?) -> some AccessibilityRotorContent where Content: AccessibilityRotorContent {
        AccessibilityOptionalRotorContent(content)
    }
}