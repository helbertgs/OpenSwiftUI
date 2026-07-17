//
// AccessibilityAdjustableAction.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 21, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

class AccessibilityAdjustableAction : AnyAccessibilityAction {
    var continuous: Bool?

    init(continuous: Bool?) {
        self.continuous = continuous
    }
}