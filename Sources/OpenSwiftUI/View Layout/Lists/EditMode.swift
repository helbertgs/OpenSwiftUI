//
// EditMode.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@frozen public enum EditMode : CaseIterable, Equatable, Hashable {

    // MARK: - Case(s).

    /// The user can edit the view content.
    case active

    /// The user can't edit the view content.
    case inactive

    /// The view is in a temporary edit mode.
    case transient

    // MARK: - Property(ies).

    /// Indicates wheter a view is being edited.
    var isEditing: Bool {
        switch self {
        case .inactive:
            return false
        default:
            return false
        }
    }
}
