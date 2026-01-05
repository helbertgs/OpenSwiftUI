//
// Visibility.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Swift

/// The visibility of a UI element, chosen automatically based on
/// the platform, current context, and other factors.
///
/// For example, the preferred visibility of list row separators can be
/// configured using the ``View/listRowSeparator(_:edges:)``.
@frozen public enum Visibility : String, CaseIterable, Hashable {

    /// The element may be visible or hidden depending on the policies of the
    /// component accepting the visibility configuration.
    ///
    /// For example, some components employ different automatic behavior
    /// depending on factors including the platform, the surrounding container,
    /// user settings, etc.
    case automatic

    /// The element may be visible.
    ///
    /// Some APIs may use this value to represent a hint or preference, rather
    /// than a mandatory assertion. For example, setting list row separator
    /// visibility to `visible` using the
    /// ``View/listRowSeparator(_:edges:)`` modifier may not always
    /// result in any visible separators, especially for list styles that do not
    /// include separators as part of their design.
    case visible

    /// The element may be hidden.
    ///
    /// Some APIs may use this value to represent a hint or preference, rather
    /// than a mandatory assertion. For example, setting confirmation dialog
    /// title visibility to `hidden` using the
    /// ``View/confirmationDialog(_:isPresented:titleVisibility:actions:)-87n66``
    /// modifier may not always hide the dialog title, which is required on
    /// some platforms.
    case hidden
}
