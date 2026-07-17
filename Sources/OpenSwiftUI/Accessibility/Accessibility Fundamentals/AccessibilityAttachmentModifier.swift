//
// AccessibilityAttachmentModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 18, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A view modifier that adds accessibility properties to the view
public struct AccessibilityAttachmentModifier {
    let storage: MutableBox<AccessibilityAttachment>
    let behavior: AccessibilityChildBehavior?

    public init(storage: MutableBox<AccessibilityAttachment>, behavior: AccessibilityChildBehavior?) {
        self.storage = storage
        self.behavior = behavior
    }
}