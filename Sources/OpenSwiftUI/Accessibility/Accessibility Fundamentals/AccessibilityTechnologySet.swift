//
// AccessibilityTechnologySet.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct AccessibilityTechnologySet : OptionSet, CaseIterable, Equatable, Hashable, Sendable {

    // MARK: - Static Property(ies).

    public static let voiceOver : AccessibilityTechnologySet = .init(rawValue: 1 << 0)
    public static let switchControl : AccessibilityTechnologySet = .init(rawValue: 1 << 1)

    // MARK: - Public Property(ies).

    public var rawValue: Int
    public static let allCases: [AccessibilityTechnologySet] = [.voiceOver, .switchControl]

    // MARK: - Constructor(s).

    @inlinable public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
