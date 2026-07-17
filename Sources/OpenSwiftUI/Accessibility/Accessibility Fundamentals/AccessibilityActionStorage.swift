//
// AccessibilityActionStorage.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 21, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

class AccessibilityActionStorage<Value> : AnyAccessibilityAction {
    var action: Value
    var category: AccessibilityActionCategory?
    var label: Text?
    var image: Image?
    var handler: Any?
    var seed: Int

    init(action: Value, category: AccessibilityActionCategory?, label: Text?, image: Image?, handler: Any?, seed: Int) {
        self.action = action
        self.category = category
        self.label = label
        self.image = image
        self.handler = handler
        self.seed = seed
    }
}