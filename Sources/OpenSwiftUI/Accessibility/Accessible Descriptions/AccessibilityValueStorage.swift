//
// AccessibilityValueStorage.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 21, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

struct AccessibilityValueStorage {
    let value: AnyAccessibilityValue?
    let description: Array<Text>

    init(value: AnyAccessibilityValue?, description: Array<Text>) {
        self.value = value
        self.description = description
    }
}