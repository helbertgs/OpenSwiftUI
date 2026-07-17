//
// AccessibilityAdjustmentDirection.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 18, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A directional indicator you use when making an accessibility adjustment.
public enum AccessibilityAdjustmentDirection : Copyable, Equatable, Hashable, Sendable {

    // MARK: - Getting an adjustment direction

    case decrement
    case increment
}